package com.douzone.bookmall.test;

import java.util.List;

import com.douzone.bookmall.dao.OrderBookDao;
import com.douzone.bookmall.vo.OrderBookVo;

public class OrderBookDaoTest {

	public static void main(String[] args) {
		insertTest();
		findAllTest();

	}
	
	private static void findAllTest() {
		List<OrderBookVo> list = new OrderBookDao().findAll();
		for(OrderBookVo vo : list) {
			System.out.println(vo);
		}
	}
	
	private static void insertTest() {
		OrderBookVo vo = null;
		
		vo=new OrderBookVo();
		vo.setOrderNo(1L);
		vo.setBookNo(1L);
		vo.setQuantity(2L);
		vo.setPrice(10000L);
		new OrderBookDao().insert(vo);

		
	}
	
	
}
