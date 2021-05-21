package com.douzone.bookmall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.douzone.bookmall.vo.CartVo;

public class CartDao {
	public Boolean insert(CartVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result = false;

		try {
			new Connect();
			conn = new Connect().getConnection();

			String sql = "insert into cart values(?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, vo.getBookNo());
			pstmt.setLong(2, vo.getCustomerNo());
			pstmt.setLong(3, vo.getQuantity());

			int count = pstmt.executeUpdate();
			result = count == 1;

		} catch (SQLException e) {
			System.out.println("error:" + e);
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public List<CartVo> findAll() {
		List<CartVo> result = new ArrayList<>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = new Connect().getConnection();

			String sql = "select * from cart";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Long book_no = rs.getLong(1);
				Long customer_no = rs.getLong(2);
				Long quantity = rs.getLong(3);

				CartVo vo = new CartVo();
				vo.setBookNo(book_no);
				vo.setCustomerNo(customer_no);
				vo.setQuantity(quantity);
				
				
				result.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("error:" + e);
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return result;
	}
}
