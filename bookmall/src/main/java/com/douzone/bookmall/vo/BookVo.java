package com.douzone.bookmall.vo;

public class BookVo {
	private Long no;
	private String name;
	private Long price;
	private Long categoryNo;
	private String categoryName;
	public BookVo() {
		
	}
	public BookVo(String name, Long price, Long categoryNo) {
		this.name = name;
		this.price = price;
		this.categoryNo = categoryNo;
	}

	public Long getNo() {
		return no;
	}

	public void setNo(Long no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getPrice() {
		return price;
	}

	public void setPrice(Long price) {
		this.price = price;
	}

	public Long getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(Long categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "BookVo [no=" + no + ", name=" + name + ", price=" + price + ", categoryNo=" + categoryNo
				+ ", categoryName=" + categoryName + "]";
	}
}
