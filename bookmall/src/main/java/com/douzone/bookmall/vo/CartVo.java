package com.douzone.bookmall.vo;

public class CartVo {
	private Long bookNo;
	private Long customerNo;
	private Long quantity;

	public CartVo() {
	}

	public CartVo(Long bookNo, Long customerNo, Long quantity) {
		this.bookNo = bookNo;
		this.customerNo = customerNo;
		this.quantity = quantity;
	}

	public Long getBookNo() {
		return bookNo;
	}

	public void setBookNo(Long bookNo) {
		this.bookNo = bookNo;
	}

	public Long getCustomerNo() {
		return customerNo;
	}

	public void setCustomerNo(Long customerNo) {
		this.customerNo = customerNo;
	}

	public Long getQuantity() {
		return quantity;
	}

	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "CartVo [bookNo=" + bookNo + ", customerNo=" + customerNo + ", quantity=" + quantity + "]";
	}
}
