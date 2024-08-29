package com.myproject.javaweb_restaurant.dto;

public class PaginationModel {
	private int sizeOfPage;
	private int currentPage;
	private int totalItems;
	private int totalPages;
	
	public PaginationModel() {
		super();
	}

	public PaginationModel(int sizeOfPage, int currentPage, int totalItems, int totalPages) {
		this.sizeOfPage = sizeOfPage;
		this.currentPage = currentPage;
		this.totalItems = totalItems;
		this.totalPages = totalPages;
	}

	public int getSizeOfPage() {
		return sizeOfPage;
	}

	public void setSizeOfPage(int sizeOfPage) {
		this.sizeOfPage = sizeOfPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalItems() {
		return totalItems;
	}

	public void setTotalItems(int totalItems) {
		this.totalItems = totalItems;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	
}
