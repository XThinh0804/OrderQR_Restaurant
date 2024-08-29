package com.myproject.javaweb_restaurant.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.myproject.javaweb_restaurant.model.Order;

@Service
public class OrderService extends BaseService<Order>{
	@Override
	public Class<Order> clazz() {
		return Order.class;
	}
	
	@Transactional
	public Order saveOrder(Order order) {
		return super.saveOrUpdate(order);
	}
	
	public List<Order> findAllActive(){
		String sql = "SELECT*FROM tbl_order WHERE status=1";
		return super.executeNativeSql(sql);
	}
}
