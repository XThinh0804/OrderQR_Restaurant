package com.myproject.javaweb_restaurant.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "tbl_order_status")
public class OrderStatus extends BaseModel{
	@Column(name = "name", length = 300, nullable = false)
	private String name;
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "order_status")
	private Set<Order> orders = new HashSet<Order>();

	// Methods add and remove elements in relational product list
	public void addRelationalOrder(Order order) {
		orders.add(order);
		order.setOrder_status(this);
	}
	public void removeRelationalOrder(Order order) {
		orders.remove(order);
		order.setOrder_status(null);
	}
	public OrderStatus() {
		
	}
	public OrderStatus(Integer id, Date createDate, Date updateDate, Boolean status, String name, Set<Order> orders) {
		super(id, createDate, updateDate, status);
		this.name = name;
		this.orders = orders;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Set<Order> getOrders() {
		return orders;
	}
	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}
	
}
