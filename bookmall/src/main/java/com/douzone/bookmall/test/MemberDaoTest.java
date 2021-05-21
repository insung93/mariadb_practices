package com.douzone.bookmall.test;

import java.util.List;

import com.douzone.bookmall.dao.CategoryDao;
import com.douzone.bookmall.dao.MemberDao;
import com.douzone.bookmall.vo.CategoryVo;
import com.douzone.bookmall.vo.MemberVo;

public class MemberDaoTest {
	
	public static void main(String[] args) {
		insertTest();
		findAllTest();
	}
	
	private static void findAllTest() {
		List<MemberVo> list = new MemberDao().findAll();
		for(MemberVo vo : list) {
			System.out.println(vo);
		}
	}
	
	private static void insertTest() {
		MemberVo vo = null;
		
		vo=new MemberVo();
		vo.setName("인성");
		vo.setTel("010-7337-5780");
		vo.setEmail("jis5780@gmail.com");
		vo.setPassword("123123");
		new MemberDao().insert(vo);
		
		vo=new MemberVo();
		vo.setName("인성2");
		vo.setTel("010-7337-5781");
		vo.setEmail("jis5780@gmail.comM");
		vo.setPassword("123123123");
		new MemberDao().insert(vo);
		
	}
}
