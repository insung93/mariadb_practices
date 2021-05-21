package com.douzone.bookmall.vo;

public class OrderBookVo {
	private Long orderNo;
	private Long bookNo;
	private Long quantity;
	private Long price;
	public OrderBookVo() {
		
	}
	
	public OrderBookVo(Long orderNo, Long bookNo, Long quantity, Long price) {
		this.orderNo = orderNo;
		this.bookNo = bookNo;
		this.quantity = quantity;
		this.price = price;
	}

	public Long getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(Long orderNo) {
		this.orderNo = orderNo;
	}
	public Long getBookNo() {
		return bookNo;
	}
	public void setBookNo(Long bookNo) {
		this.bookNo = bookNo;
	}
	public Long getQuantity() {
		return quantity;
	}
	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "OrderBookVo [orderNo=" + orderNo + ", bookNo=" + bookNo + ", quantity=" + quantity + ", price=" + price
				+ "]";
	}
}
