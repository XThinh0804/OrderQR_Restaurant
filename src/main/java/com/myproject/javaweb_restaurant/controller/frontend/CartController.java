package com.myproject.javaweb_restaurant.controller.frontend;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myproject.javaweb_restaurant.controller.BaseController;
import com.myproject.javaweb_restaurant.dto.Cart;
import com.myproject.javaweb_restaurant.dto.CartFood;
import com.myproject.javaweb_restaurant.model.Food;
import com.myproject.javaweb_restaurant.model.Order;
import com.myproject.javaweb_restaurant.model.OrderFood;
import com.myproject.javaweb_restaurant.model.OrderStatus;
import com.myproject.javaweb_restaurant.model.User;
import com.myproject.javaweb_restaurant.service.FoodService;
import com.myproject.javaweb_restaurant.service.OrderService;
import com.myproject.javaweb_restaurant.service.OrderStatusService;

@Controller
public class CartController extends BaseController {
	@Autowired
	private FoodService foodService;

	@RequestMapping(value = "/add-to-cart", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addToCart(final Model model, @RequestBody CartFood cartFood,
			final HttpServletRequest request) {
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		if (cartFood.getQuantity().intValue() <= 0) {
			jsonResult.put("message", "Số lượng không hợp lệ");
		} else {// Sản phẩm hợp lệ, thêm vào giỏ hàng
				// Kiểm tra xem có giỏ hàng hay chưa
			Cart cart = null;
			HttpSession session = request.getSession();
			if (session.getAttribute("cart") == null) {// chưa tạo giỏ hàng
				cart = new Cart();
				session.setAttribute("cart", cart);
			}

			// Lấy giỏ hàng để xử lý (Thêm sản phẩm)
			cart = (Cart) session.getAttribute("cart");

			// Kiểm tra xem món ăn có trong giỏ hàng hay chưa
			int index = cart.findFoodById(cartFood.getId());
			if (index != -1) {// Sản phẩm đã có trong giỏ hàng
				cart.getCartFoods().get(index).updateQuantity(cartFood.getQuantity());
			} else {
				Food dbfood = foodService.getById(cartFood.getId());
				cartFood.setImage(dbfood.getImage());
				cartFood.setPrice(dbfood.getPrice());
				// Thêm sản phẩm vào giỏ hàng
				cart.getCartFoods().add(cartFood);
			}
			jsonResult.put("code", "200");
			jsonResult.put("message", "Đã thêm món ăn vào giỏ hàng");
			jsonResult.put("totalCartFoods", cart.totalCartFoods());
		}
		return ResponseEntity.ok(jsonResult);
	}

	@RequestMapping(value = "/cart-view/{tableNumber}",method = RequestMethod.GET)
	public String cartView(final Model model, final HttpServletRequest request,@PathVariable("tableNumber") String tableNumber) {
		HttpSession session = request.getSession();
		if (session.getAttribute("cart") != null) {// Có giỏ hàng
			Cart cart = (Cart) session.getAttribute("cart");
			cart.setTableNumber(tableNumber);
			String message = "Có " + cart.getCartFoods().size() + " loại sản phẩm với tổng cộng "
					+ cart.totalCartFoods() + " sản phẩm";
			model.addAttribute("message", message);
			BigDecimal totalCartPrice = cart.totalCartPrice();
			model.addAttribute("totalCartPrice", totalCartPrice);
			model.addAttribute("tableNumber",tableNumber);
		}
		return "frontend/cart-view";
	}

	public StringBuilder toCurrency(BigDecimal num) {
		StringBuilder str = new StringBuilder("" + num.longValue());
		int i = str.length();
		int j = 0;
		while (i > 1) {
			i--;
			j++;
			if (j % 3 == 0) {
				str.insert(i, ",");
			}
		}
		return str;
	}

	@RequestMapping(value = "/update-food-quantity", method = RequestMethod.POST)
	ResponseEntity<Map<String, Object>> updateFoodQuantity(@RequestBody CartFood cartFood,
			final HttpServletRequest request) {
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		if (session.getAttribute("cart") != null) {
			Cart cart = (Cart) session.getAttribute("cart");
			int index = cart.findFoodById(cartFood.getId());
			if (index != -1) {
				// Kiểm tra trường hợp bấm nút - (giảm)
				if (cartFood.getQuantity().intValue() == -1) {
					if (cart.getCartFoods().get(index).getQuantity().intValue() > 1) {
						cart.getCartFoods().get(index).updateQuantity(cartFood.getQuantity());
					}
				} else {// Bấm nút +
					cart.getCartFoods().get(index).updateQuantity(cartFood.getQuantity());
				}
			}
			jsonResult.put("newQuantity", cart.getCartFoods().get(index).getQuantity());
			jsonResult.put("totalPrice", toCurrency(cart.getCartFoods().get(index).totalPrice()));
			jsonResult.put("totalCartFoods", cart.totalCartFoods());
			jsonResult.put("totalCartPrice", toCurrency(cart.totalCartPrice()));
			jsonResult.put("foodId", cartFood.getId());
		}
		return ResponseEntity.ok(jsonResult);
	}
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderStatusService orderStatusService;
	@RequestMapping(value = "/place-order/{tableNumber}", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> placeOrder(@RequestBody User user, HttpServletRequest request,@PathVariable("tableNumber") String tableNumber) {
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		if (user.getName().trim() == null || user.getName().length() <= 0) {
			jsonResult.put("message", "Bạn chưa nhập tên!");
		} else if (user.getMobile().trim() == null || user.getMobile().trim().length() < 10) {
			jsonResult.put("message", "Bạn chưa nhập đúng số điện thoại!");
		} else {
			// Lấy giỏ hàng
			HttpSession session = request.getSession();
			if (session.getAttribute("cart") == null) {
				jsonResult.put("message", "Bạn chưa có giỏ hàng");
			} else {
				Cart cart = (Cart) session.getAttribute("cart");
				Order order = new Order();
				for (CartFood cartFood : cart.getCartFoods()) {
					// Lấy sản phẩm trong db
					Food food = foodService.getById(cartFood.getId());
					OrderFood orderFood = new OrderFood();
					orderFood.setFood(food);
					orderFood.setQuantity(cartFood.getQuantity().intValue());
					orderFood.setName(food.getName());
					order.addRelationalOrderFood(orderFood);
				}
				// Lưu đơn hàng vào db
				OrderStatus orderStatus = orderStatusService.getById(1);
				order.setOrder_status(orderStatus);
				order.setDiningTable(tableNumber);
				order.setCreateDate(new Date());
				order.setTotal(cart.totalCartPrice());
				order.setCustomer_name(user.getName());
				order.setCustomer_mobile(user.getMobile());
				orderService.saveOrder(order);
				jsonResult.put("message", "Giỏ hàng của bạn đã được lưu");
				//Xóa giỏ hàng
			
				session.setAttribute("cart", new Cart());
			}
		}
		return ResponseEntity.ok(jsonResult);
	}
}
