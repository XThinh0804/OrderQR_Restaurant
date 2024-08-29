package com.myproject.javaweb_restaurant.controller;

import java.math.BigInteger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.myproject.javaweb_restaurant.dto.Cart;
import com.myproject.javaweb_restaurant.model.User;

@Controller
public class BaseController {
	@ModelAttribute("title")
	public String getTitle() {
		return "Restaurant";
	}
	@ModelAttribute("totalCartFoods")
	public BigInteger totalCartFoods(final HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("cart") == null) {
			return BigInteger.ZERO;
		}else {
			Cart cart =(Cart) session.getAttribute("cart");
			return cart.totalCartFoods();
		}
		
	}
	@ModelAttribute("loginedUser")
	public User getLoginedUser() {
		Object loginedUser = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(loginedUser != null && loginedUser instanceof UserDetails) {
			User user = (User) loginedUser;
			return user;
		}
		return new User();
	}
	@ModelAttribute("isLogined")
	public boolean isLogined() {
		Object loginedUser = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(loginedUser != null && loginedUser instanceof UserDetails) {
			return true;
		}
		return false;
	}
}
