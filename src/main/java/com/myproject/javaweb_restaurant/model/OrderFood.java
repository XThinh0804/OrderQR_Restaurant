package com.myproject.javaweb_restaurant.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "tbl_order_food")
public class OrderFood extends BaseModel{
	@Column(name = "food_name", length = 300, nullable = false)
	private String name;
	@Column(name = "quantity", nullable = true)
	private int quantity;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "order_id")
	private Order order;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "food_id")
	private Food food;
	public OrderFood() {
		
	}
	public OrderFood(Integer id, Date createDate, Date updateDate, Boolean status, String name, int quantity,
			Order order, Food food) {
		super(id, createDate, updateDate, status);
		this.name = name;
		this.quantity = quantity;
		this.order = order;
		this.food = food;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Food getFood() {
		return food;
	}
	public void setFood(Food food) {
		this.food = food;
	}
}
