package com.myproject.javaweb_restaurant.dto;

import java.math.BigDecimal;
import java.math.BigInteger;

public class CartFood {
	private int id;
	private String name;
	private BigInteger quantity;
	private BigDecimal price;
	private String image;
	

	public BigDecimal totalPrice() {
		return this.price.multiply(new BigDecimal(this.quantity));
	}
	public void updateQuantity(BigInteger quantity) {
		this.quantity = this.quantity.add(quantity);
	}
	public CartFood() {
		super();
	}
	
	public CartFood(int id, String name, BigInteger quantity, BigDecimal price, String image) {
		this.id = id;
		this.name = name;
		this.quantity = quantity;
		this.price = price;
		this.image = image;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public BigInteger getQuantity() {
		return quantity;
	}
	public void setQuantity(BigInteger quantity) {
		this.quantity = quantity;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
}
