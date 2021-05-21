package com.douzone.bookmall.test;

import java.util.List;

import com.douzone.bookmall.dao.CartDao;
import com.douzone.bookmall.vo.CartVo;

public class CartDaoTest {

	public static void main(String[] args) {
		insertTest();
		findAllTest();
	}

	private static void findAllTest() {
		List<CartVo> list = new CartDao().findAll();
		for (CartVo vo : list) {
			System.out.println(vo);
		}
	}

	private static void insertTest() {
		CartVo vo = null;

		vo = new CartVo();
		vo.setBookNo(1L);
		vo.setCustomerNo(2L);
		vo.setQuantity(4L);
		new CartDao().insert(vo);
		
		vo = new CartVo();
		vo.setBookNo(2L);
		vo.setCustomerNo(1L);
		vo.setQuantity(2L);
		new CartDao().insert(vo);

	}
}
