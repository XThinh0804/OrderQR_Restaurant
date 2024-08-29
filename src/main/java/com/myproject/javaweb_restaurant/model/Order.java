package com.myproject.javaweb_restaurant.model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_order")
public class Order extends BaseModel{
	@Column(name = "total", nullable = true)
	private BigDecimal total;
	@Column(name = "customer_name", length = 300, nullable = false)
	private String customer_name;
	@Column(name = "customer_mobile", length = 120, nullable = true)
	private String customer_mobile;
	@Column(name = "dining_table", length = 300, nullable = true)
	private String diningTable;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "order_status_id")
	private OrderStatus order_status;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "order")
	private Set<OrderFood> orderFoods = new HashSet<OrderFood>();

	public void addRelationalOrderFood(OrderFood orderFood) {
		orderFoods.add(orderFood);
		orderFood.setOrder(this);
	}
	public void removeRelationalOrderFood(OrderFood orderFood) {
		orderFoods.remove(orderFood);
		orderFood.setOrder(null);
	}
	
	public Order() {
		
	}

	public Order(Integer id, Date createDate, Date updateDate, Boolean status, BigDecimal total, String customer_name,
			String customer_mobile, String diningTable, OrderStatus order_status, Set<OrderFood> orderFoods) {
		super(id, createDate, updateDate, status);
		this.total = total;
		this.customer_name = customer_name;
		this.customer_mobile = customer_mobile;
		this.diningTable = diningTable;
		this.order_status = order_status;
		this.orderFoods = orderFoods;
	}
	
	public BigDecimal getTotal() {
		return total;
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}

	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public String getCustomer_mobile() {
		return customer_mobile;
	}

	public void setCustomer_mobile(String customer_mobile) {
		this.customer_mobile = customer_mobile;
	}

	public OrderStatus getOrder_status() {
		return order_status;
	}

	public void setOrder_status(OrderStatus order_status) {
		this.order_status = order_status;
	}

	public String getDiningTable() {
		return diningTable;
	}

	public void setDiningTable(String diningTable) {
		this.diningTable = diningTable;
	}
	public Set<OrderFood> getOrderFoods() {
		return orderFoods;
	}
	public void setOrderFoods(Set<OrderFood> orderFoods) {
		this.orderFoods = orderFoods;
	}
	
}