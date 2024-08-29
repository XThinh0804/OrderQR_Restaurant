package com.myproject.javaweb_restaurant.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;


@Entity
@Table(name = "tbl_role")
public class Role extends BaseModel implements GrantedAuthority{
	@Column(name = "name", length = 300, nullable = false)
	private String name;
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "tbl_user_role", 
			joinColumns = @JoinColumn(name = "role_id"), 
			inverseJoinColumns = @JoinColumn(name = "user_id"))
	private List<User> users = new ArrayList<User>();
	public Role() {
		
	}
	public Role(Integer id, Date createDate, Date updateDate, Boolean status, String name, List<User> users) {
		super(id, createDate, updateDate, status);
		this.name = name;
		this.users = users;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	@Override
	public String getAuthority() {
		// TODO Auto-generated method stub
		return this.name;
	}
}
