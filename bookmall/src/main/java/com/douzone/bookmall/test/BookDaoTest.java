package com.douzone.bookmall.test;

import java.util.List;

import com.douzone.bookmall.dao.BookDao;
import com.douzone.bookmall.vo.BookVo;

public class BookDaoTest {

	public static void main(String[] args) {
		insertTest();
		findAllTest();
	}
	
	private static void findAllTest() {
		List<BookVo> list = new BookDao().findAll();
		for(BookVo vo : list) {
			System.out.println(vo);
		}
	}
	
	private static void insertTest() {
		BookVo vo = null;
		
		vo=new BookVo();
		vo.setName("이것이 자바다");
		vo.setPrice(30000L);
		vo.setCategoryNo(1L);
		new BookDao().insert(vo);
		
		vo=new BookVo();
		vo.setName("SQL 자격검정 실전문제");
		vo.setPrice(16000L);
		vo.setCategoryNo(2L);
		new BookDao().insert(vo);
		
	}
	
	
}
