package com.myproject.javaweb_restaurant.model;

import java.math.BigDecimal;
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
@Table(name = "tbl_food")
public class Food extends BaseModel{
	@Column(name = "name", length = 300, nullable = false)
	private String name;

	@Column(name = "image", length = 300, nullable = true)
	private String image;

	@Column(name = "price", nullable = true)
	private BigDecimal price;
	
	@Column(name = "description", length = 500, nullable = true)
	private String description;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "food")
	private Set<OrderFood> orderFoods = new HashSet<OrderFood>();

	public void addRelationalOrderFood(OrderFood orderFood) {
		orderFoods.add(orderFood);
		orderFood.setFood(this);
	}
	public void removeRelationalOrderFood(OrderFood orderFood) {
		orderFoods.remove(orderFood);
		orderFood.setFood(null);
	}
	
	public Food() {
		
	}

	

	public Food(Integer id, Date createDate, Date updateDate, Boolean status, String name, String image,
			BigDecimal price, String description, Set<OrderFood> orderFoods) {
		super(id, createDate, updateDate, status);
		this.name = name;
		this.image = image;
		this.price = price;
		this.description = description;
		this.orderFoods = orderFoods;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	public Set<OrderFood> getOrderFoods() {
		return orderFoods;
	}
	public void setOrderFoods(Set<OrderFood> orderFoods) {
		this.orderFoods = orderFoods;
	}
	
}
