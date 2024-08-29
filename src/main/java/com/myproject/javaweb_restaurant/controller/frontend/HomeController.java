package com.myproject.javaweb_restaurant.controller.frontend;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myproject.javaweb_restaurant.controller.BaseController;
import com.myproject.javaweb_restaurant.dto.PaginationModel;
import com.myproject.javaweb_restaurant.dto.RestaurantContant;
import com.myproject.javaweb_restaurant.model.Food;
import com.myproject.javaweb_restaurant.service.FoodService;


@Controller
public class HomeController extends BaseController implements RestaurantContant{
	@Autowired
	private FoodService foodService;
	@RequestMapping(value="/",method =RequestMethod.GET)
	public String home(final Model model,final HttpServletRequest request) {
		List<Food> foods = foodService.findAllActive();
		PaginationModel foodPagination = new PaginationModel();
		foodPagination.setTotalItems(foods.size());
		foodPagination.setCurrentPage(1);
		if (!StringUtils.isEmpty(request.getParameter("currentPage"))) {
			foodPagination.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
		}
		foodPagination.setSizeOfPage(SIZE_OF_INDEX);
		int totalPages = foods.size() / SIZE_OF_INDEX;
		if (foods.size() % SIZE_OF_INDEX != 0) {
			totalPages++;
		}
		foodPagination.setTotalPages(totalPages);
		int firstIndex = (foodPagination.getCurrentPage() - 1) * SIZE_OF_INDEX;
		int lastIndex = firstIndex + SIZE_OF_INDEX;
		if (lastIndex > foods.size()) {
			lastIndex = foods.size();
		}
		List<Food> allFoods = foods.subList(firstIndex, lastIndex);
		model.addAttribute("foods", allFoods);
		model.addAttribute("foodPagination",foodPagination);
		return "frontend/index";
	}
}
