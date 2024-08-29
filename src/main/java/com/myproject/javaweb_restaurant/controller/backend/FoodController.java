package com.myproject.javaweb_restaurant.controller.backend;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.myproject.javaweb_restaurant.controller.BaseController;
import com.myproject.javaweb_restaurant.dto.PaginationModel;
import com.myproject.javaweb_restaurant.dto.RestaurantContant;
import com.myproject.javaweb_restaurant.model.Food;
import com.myproject.javaweb_restaurant.service.FoodService;

@Controller
@RequestMapping("/admin/food/")
public class FoodController extends BaseController implements RestaurantContant {
	@Autowired
	private FoodService foodService;

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String viewFoods(final Model model,
			final HttpServletRequest request) {
		List<Food> foods = foodService.findAllActive();
		PaginationModel foodPagination = new PaginationModel();
		foodPagination.setTotalItems(foods.size());
		foodPagination.setCurrentPage(1);
		if (!StringUtils.isEmpty(request.getParameter("currentPage"))) {
			foodPagination.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
		}
		foodPagination.setSizeOfPage(SIZE_OF_PAGE);
		int totalPages = foods.size() / SIZE_OF_PAGE;
		if (foods.size() % SIZE_OF_PAGE != 0) {
			totalPages++;
		}
		foodPagination.setTotalPages(totalPages);
		int firstIndex = (foodPagination.getCurrentPage() - 1) * SIZE_OF_PAGE;
		int lastIndex = firstIndex + SIZE_OF_PAGE;
		if (lastIndex > foods.size()) {
			lastIndex = foods.size();
		}
		List<Food> allFoods = foods.subList(firstIndex, lastIndex);
		model.addAttribute("foods", allFoods);
		model.addAttribute("foodPagination",foodPagination);
		return "backend/food-list";
	}

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String addFood(final Model model) {
		Food food = new Food();
		food.setCreateDate(new Date());
		food.setStatus(true);
		model.addAttribute("food", food);
		return "backend/food-add";
	}

	@RequestMapping(value = "add-save", method = RequestMethod.POST)
	public String saveAddFood(final Model model, @ModelAttribute("food") Food food,
			@RequestParam("imageFile") MultipartFile imageFile) throws IOException {
		foodService.saveFood(food, imageFile);
		return "redirect:list";
	}

	@RequestMapping(value = "edit/{foodId}", method = RequestMethod.GET)
	public String editFood(final Model model, @PathVariable("foodId") int foodId) {
		Food food = foodService.getById(foodId);
		food.setUpdateDate(new Date());
		model.addAttribute("food", food);
		return "backend/food-edit";
	}

	@RequestMapping(value = "edit-save", method = RequestMethod.POST)
	public String saveEditFood(final Model model, @ModelAttribute("food") Food food,
			@RequestParam("imageFile") MultipartFile imageFile) throws IOException {
		foodService.saveEditFood(food, imageFile);
		return "redirect:list";
	}
	@RequestMapping(value = "delete/{foodId}", method = RequestMethod.GET)
	public String deleteFood(final Model model,
			@PathVariable("foodId") int foodId) {
		Food food = foodService.getById(foodId);
		if(food.getImage() != null && !food.getImage().isEmpty()) {
			String path = FOLDER_UPLOAD + food.getImage();
			File file = new File(path);
			file.delete();
		}
		food.setStatus(false);
		foodService.saveOrUpdate(food);
		return "redirect:/admin/food/list";
	}
}
