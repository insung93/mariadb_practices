package com.douzone.bookmall.test;

import java.util.List;

import com.douzone.bookmall.dao.OrderDao;
import com.douzone.bookmall.vo.OrderVo;

public class OrderDaoTest {

	public static void main(String[] args) {
		insertTest();
		findAllTest();

	}
	
	private static void findAllTest() {
		List<OrderVo> list = new OrderDao().findAll();
		for(OrderVo vo : list) {
			System.out.println(vo);
		}
	}
	
	private static void insertTest() {
		OrderVo vo = null;
		
		vo=new OrderVo();
		vo.setPrice(100000L);
		vo.setDestination("부산");
		vo.setCustomerNo(1L);
		new OrderDao().insert(vo);

		
	}
	
	
}
