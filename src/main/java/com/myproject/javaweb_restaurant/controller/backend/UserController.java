package com.myproject.javaweb_restaurant.controller.backend;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myproject.javaweb_restaurant.controller.BaseController;
import com.myproject.javaweb_restaurant.model.Role;
import com.myproject.javaweb_restaurant.model.User;
import com.myproject.javaweb_restaurant.service.RoleService;
import com.myproject.javaweb_restaurant.service.UserService;


@Controller
@RequestMapping("/admin/user/")
public class UserController extends BaseController{
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	@RequestMapping(value = "list", method =RequestMethod.GET)
	public String viewUser(final Model model) {
		List<User> users = new ArrayList<User>();
		users = userService.findAllActive();
		model.addAttribute("users",users);
		return "backend/user-list";
	}
	@RequestMapping(value = "add", method =RequestMethod.GET)
	public String addUser(final Model model) {
		List<Role> roles = roleService.findAllActive();
		List<User> users = userService.findAllActive();
		User user = new User();
		user.setCreateDate(new Date());
		model.addAttribute("users",users);
		model.addAttribute("user",user);
		model.addAttribute("roles",roles);
		return "backend/user-add";
	}
	@RequestMapping(value = "add-save", method =RequestMethod.POST)
	public String saveAddUser(final Model model,
			@ModelAttribute("user") User user,final HttpServletRequest request) {
		Role role =roleService.getById(Integer.parseInt(request.getParameter("roleId")));
		user.setStatus(true);
		user.addRelationalUserRole(role);
		user.setPassword(new BCryptPasswordEncoder(4).encode(request.getParameter("password")));
		userService.saveOrUpdate(user);
		return "redirect:list";
	}
	@RequestMapping(value = "edit/{userId}", method =RequestMethod.GET)
	public String editCategories(final Model model,
			@PathVariable("userId") int userId) {
		User user = userService.getById(userId);
		user.setUpdateDate(new Date());
		model.addAttribute("user",user);
		return "backend/user-edit";
	}
	@RequestMapping(value = "edit-save", method =RequestMethod.POST)
	public String saveEditUser(final Model model,
			@ModelAttribute("user") User user,final HttpServletRequest request) {
		user.setPassword(new BCryptPasswordEncoder(4).encode(request.getParameter("password")));
		userService.saveOrUpdate(user);
		return "redirect:list";
	}
	@RequestMapping(value = "delete/{userId}", method = RequestMethod.GET)
	public String deleteUser(final Model model,
			@PathVariable("userId") int userId) {
		
		User user = userService.getById(userId);
		user.setStatus(false);
		userService.saveOrUpdate(user);
		return "redirect:/admin/user/list";
	}
}
