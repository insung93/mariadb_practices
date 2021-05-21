package com.douzone.bookmall.vo;

public class OrderVo {
	private Long no;
	private String orderNo;
	private Long price;
	private String destination;
	private Long customerNo;
	public OrderVo() {
		
	}
	public OrderVo(Long price, String destination, Long customerNo) {
		this.price = price;
		this.destination = destination;
		this.customerNo = customerNo;
	}
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public Long getCustomerNo() {
		return customerNo;
	}
	public void setCustomerNo(Long customerNo) {
		this.customerNo = customerNo;
	}
	@Override
	public String toString() {
		return "OrderVo [no=" + no + ", orderNo=" + orderNo + ", price=" + price + ", destination=" + destination
				+ ", customerNo=" + customerNo + "]";
	}
	
}
