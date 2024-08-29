package com.myproject.javaweb_restaurant.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.myproject.javaweb_restaurant.model.Role;

@Service
public class RoleService extends BaseService<Role>{
	@Override
	public Class<Role> clazz() {
		return Role.class;
	}
	
	public List<Role> findAllActive(){
		String sql = "SELECT*FROM tbl_role WHERE status=1";
		return super.executeNativeSql(sql);
	}
	
	@Transactional
	public void deleteRole(int id) {
		super.deleteById(id);
	}
	public Role getRoleByName(String name) {
		String sql = "SELECT * FROM tbl_role r Where r.name = '"+name+"'";
		List<Role> roles = super.executeNativeSql(sql);
		if(roles != null && roles.size() > 0 ) {
			return roles.get(0);
		}
		else {
			return new Role();
		}
	}
}
