package com.myproject.javaweb_restaurant.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.myproject.javaweb_restaurant.model.User;

@Service
public class UserService extends BaseService<User>{
	@Override
	public Class<User> clazz(){
		return User.class;
	}
	
	public List<User> findAllActive(){
		String sql = "SELECT*FROM tbl_user WHERE status=1";
		return super.executeNativeSql(sql);
	}
	
	@Transactional
	public void deleteCategory(int id) {
		super.deleteById(id);
	}
}
