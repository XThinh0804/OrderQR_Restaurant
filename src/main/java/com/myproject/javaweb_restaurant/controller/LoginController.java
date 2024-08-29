package com.myproject.javaweb_restaurant.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myproject.javaweb_restaurant.model.Role;
import com.myproject.javaweb_restaurant.model.User;
import com.myproject.javaweb_restaurant.service.RoleService;
import com.myproject.javaweb_restaurant.service.UserService;

@Controller
public class LoginController extends BaseController{
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	@RequestMapping(value = "/login",method = RequestMethod.GET)
	public String Login() {
		
		return "login";
	}
	
	@RequestMapping(value = "/signup",method = RequestMethod.GET)
	public String Signup() {
		
		return "signup";
	}
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String Register(final HttpServletRequest request) {
		String userName = request.getParameter("username");
		String passWord = request.getParameter("password");
		String mobile = request.getParameter("mobile");
		User user = new User();
		Role role = roleService.getRoleByName("GUEST");
		user.setUsername(userName);
		user.setPassword(new BCryptPasswordEncoder(4).encode(passWord));
		user.setName(userName);
		user.setMobile(mobile);
		user.addRelationalUserRole(role);
		userService.saveOrUpdate(user);
		return "redirect:/login";
	}
}
