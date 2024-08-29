package com.myproject.javaweb_restaurant.controller.backend;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myproject.javaweb_restaurant.controller.BaseController;


@Controller
@RequestMapping("/admin/home/")
public class HomeAdminController extends BaseController{
	@RequestMapping(value = "list", method =RequestMethod.GET)
	public String viewHomePage(final Model model) {
		
		return "backend/home";
	}
}
