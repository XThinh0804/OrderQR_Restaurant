package com.myproject.javaweb_restaurant.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.myproject.javaweb_restaurant.model.OrderFood;

@Service
public class OrderFoodService extends BaseService<OrderFood>{
	@Override
	public Class<OrderFood> clazz() {
		return OrderFood.class;
	}
	
	@Transactional
	public OrderFood saveOrderFood(OrderFood orderFood) {
		return super.saveOrUpdate(orderFood);
	}
	
	public List<OrderFood> findAllActive(){
		String sql = "SELECT*FROM tbl_order_food WHERE status=1";
		return super.executeNativeSql(sql);
	}
	public List<OrderFood> findAllOrderId(int orderId){
		String sql = "SELECT*FROM tbl_order_food WHERE order_id = "+ orderId;
		return super.executeNativeSql(sql);
	}
}
