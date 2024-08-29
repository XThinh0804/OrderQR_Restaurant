package com.myproject.javaweb_restaurant.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.myproject.javaweb_restaurant.model.OrderStatus;


@Service
public class OrderStatusService extends BaseService<OrderStatus>{
	@Override
	public Class<OrderStatus> clazz() {
		return OrderStatus.class;
	}
	
	@Transactional
	public OrderStatus saveOrder(OrderStatus orderStatus) {
		return super.saveOrUpdate(orderStatus);
	}
	
	public List<OrderStatus> findAllActive(){
		String sql = "SELECT*FROM tbl_order_status WHERE status=1";
		return super.executeNativeSql(sql);
	}
}
