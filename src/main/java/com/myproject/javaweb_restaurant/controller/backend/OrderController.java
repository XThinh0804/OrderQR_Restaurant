package com.myproject.javaweb_restaurant.controller.backend;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myproject.javaweb_restaurant.controller.BaseController;
import com.myproject.javaweb_restaurant.model.Order;
import com.myproject.javaweb_restaurant.model.OrderFood;
import com.myproject.javaweb_restaurant.model.OrderStatus;
import com.myproject.javaweb_restaurant.service.OrderFoodService;
import com.myproject.javaweb_restaurant.service.OrderService;
import com.myproject.javaweb_restaurant.service.OrderStatusService;

@Controller
@RequestMapping("/admin/order/")
public class OrderController extends BaseController{
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderFoodService orderFoodService;
	@Autowired
	private OrderStatusService orderStatusService;
	@RequestMapping(value = "list", method =RequestMethod.GET)
	public String viewUser(final Model model) {
		List<Order> orders = orderService.findAllActive();
		model.addAttribute("orders",orders);
		return "backend/order-list";
	}
	@RequestMapping(value = "edit/{orderId}", method = RequestMethod.GET)
	public String editFood(final Model model, @PathVariable("orderId") int orderId) {
		List<OrderStatus> ordersStatus = orderStatusService.findAllActive();
		Order order = orderService.getById(orderId);
		model.addAttribute("order", order);
		model.addAttribute("ordersStatus", ordersStatus);
		return "backend/order-edit";
	}
	@RequestMapping(value = "edit-save", method =RequestMethod.POST)
	public String saveEditProduct(final Model model,
			@ModelAttribute("order") Order order){
		orderService.saveOrder(order);
		return "redirect:list";
	}
	@RequestMapping(value = "detail/{orderId}", method =RequestMethod.GET)
	public String viewOrderDetail(final Model model,@PathVariable("orderId") int orderId){
		List<OrderFood> orderFoods = orderFoodService.findAllOrderId(orderId);
		model.addAttribute("orderFoods",orderFoods);
		model.addAttribute("orderId",orderId);
		return "backend/order-detail";
	}
}
