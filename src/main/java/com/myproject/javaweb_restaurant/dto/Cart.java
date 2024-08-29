package com.myproject.javaweb_restaurant.dto;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;


public class Cart {
	private ArrayList<CartFood> cartFoods = new ArrayList<CartFood>();
	private String tableNumber;
	public int findProductById(int productId) {
		for(int index = 0; index < this.cartFoods.size(); index ++) {
			if(cartFoods.get(index).getId() == productId) {
				return index;
			}
		}
		return -1;
	}
	public BigDecimal totalCartPrice() {
		BigDecimal total = BigDecimal.ZERO;
		for(CartFood cartFood : this.cartFoods) {
			total = total.add(cartFood.totalPrice());
		}
		return total;
	}
	//Tổng số lượng sản phẩm trong giỏ hàng
	public BigInteger totalCartFoods() {
		BigInteger total = BigInteger.ZERO;
		for(CartFood cartFood : this.cartFoods) {
			total = total.add(cartFood.getQuantity());
		}
		return total;
	}
	
	public Cart() {
		super();
	}
	public Cart(ArrayList<CartFood> cartFoods) {
		this.cartFoods = cartFoods;
	}
	public ArrayList<CartFood> getCartFoods() {
		return cartFoods;
	}
	public void setCartFoods(ArrayList<CartFood> cartFoods) {
		this.cartFoods = cartFoods;
	}
	public String getTableNumber() {
		return tableNumber;
	}
	public void setTableNumber(String tableNumber) {
		this.tableNumber = tableNumber;
	}
	
}
