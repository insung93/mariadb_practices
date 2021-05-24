package com.douzone.bookmall.test;

import java.util.List;

import com.douzone.bookmall.dao.BookDao;
import com.douzone.bookmall.dao.CartDao;
import com.douzone.bookmall.dao.CategoryDao;
import com.douzone.bookmall.dao.MemberDao;
import com.douzone.bookmall.dao.OrderBookDao;
import com.douzone.bookmall.dao.OrderDao;
import com.douzone.bookmall.vo.BookVo;
import com.douzone.bookmall.vo.CartVo;
import com.douzone.bookmall.vo.CategoryVo;
import com.douzone.bookmall.vo.MemberVo;
import com.douzone.bookmall.vo.OrderBookVo;
import com.douzone.bookmall.vo.OrderVo;

public class BookMall {

	public static void main(String[] args) {
//		CategoryDao categoryDao = new CategoryDao();
//		categoryDao.insert();
//		categoryDao.insert();
//		categoryDao.insert();
//		List list = categoryDao.findAll();
//		for(CategoryVo vo : list) {
//			System.out.println(vo);
//		}
		//insertDB();
		System.out.println("========================================Category List========================================");
		List<CategoryVo> list = new CategoryDao().findAll();
		for(CategoryVo vo : list) {
			System.out.println(vo);
		}
		System.out.println("==========================================Book List==========================================");
		List<BookVo> list2 = new BookDao().findAll();
		for(BookVo vo : list2) {
			System.out.println(vo);
		}
		System.out.println("========================================Customer List========================================");
		List<MemberVo> list3 = new MemberDao().findAll();
		for(MemberVo vo : list3) {
			System.out.println(vo);
		}
		System.out.println("==========================================Cart List==========================================");
		List<CartVo> list4 = new CartDao().findAll();
		for (CartVo vo : list4) {
			System.out.println(vo);
		}
		System.out.println("==========================================Order List=========================================");
		List<OrderVo> list5 = new OrderDao().findAll();
		for(OrderVo vo : list5) {
			System.out.println(vo);
		}
		System.out.println("=======================================OrderBook List========================================");
		List<OrderBookVo> list6 = new OrderBookDao().findAll();
		for(OrderBookVo vo : list6) {
			System.out.println(vo);
		}
		System.out.println("=============================================================================================");
	}

	private static void insertDB() {
		new CategoryDao().insert(new CategoryVo("인문"));
		new CategoryDao().insert(new CategoryVo("역사"));
		new CategoryDao().insert(new CategoryVo("예술"));
		new CategoryDao().insert(new CategoryVo("사회"));
		new CategoryDao().insert(new CategoryVo("과학"));
		new BookDao().insert(new BookVo("오래된 질문",14400L,1L));
		new BookDao().insert(new BookVo("바보의 세계",19800L,2L));
		new BookDao().insert(new BookVo("예술의 주름들",17550L,3L));
		new BookDao().insert(new BookVo("아이 세이 노!",13500L,4L));
		new BookDao().insert(new BookVo("사이언스 고즈 온",14850L,5L));
		new MemberDao().insert(new MemberVo("둘리","010-1111-1111","enffl@abc.com","enffl1"));
		new MemberDao().insert(new MemberVo("또치","010-2222-2222","ehcl@def.com","ehcl1"));
		new MemberDao().insert(new MemberVo("마이콜","010-3333-3333","akdlzhf@abc.com","akdlzhf1"));
		new MemberDao().insert(new MemberVo("도우너","010-4444-4444","ehdnsj@abc.com","ehdnsj1"));
		new MemberDao().insert(new MemberVo("희동이","010-5555-5555","gmlehddl@abc.com","gmlehddl1"));
		new CartDao().insert(new CartVo(2L,1L,5L));
		new CartDao().insert(new CartVo(2L,2L,3L));
		new CartDao().insert(new CartVo(4L,2L,1L));
		new CartDao().insert(new CartVo(3L,4L,1L));
		new CartDao().insert(new CartVo(5L,1L,2L));
		new OrderDao().insert(new OrderVo(120000L,"부산",1L));
		new OrderDao().insert(new OrderVo(80000L,"서울",2L));
		new OrderDao().insert(new OrderVo(20000L,"대구",3L));
		new OrderDao().insert(new OrderVo(60000L,"부산",4L));
		new OrderDao().insert(new OrderVo(70000L,"부산",5L));
		new OrderBookDao().insert(new OrderBookVo(1L,2L,1L,30000L));
		new OrderBookDao().insert(new OrderBookVo(2L,1L,2L,50000L));
		new OrderBookDao().insert(new OrderBookVo(3L,3L,1L,20000L));
		new OrderBookDao().insert(new OrderBookVo(4L,5L,2L,60000L));
		new OrderBookDao().insert(new OrderBookVo(5L,4L,3L,80000L));
		
	}

}
