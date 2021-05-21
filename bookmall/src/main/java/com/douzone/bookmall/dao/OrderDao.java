package com.douzone.bookmall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.douzone.bookmall.vo.OrderVo;

public class OrderDao {
	public Boolean insert(OrderVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result = false;

		try {
			new Connect();
			conn = new Connect().getConnection();

			String sql = "insert into delivery values(null,date_format(now(6),'%Y%m%d%h%i%s-%f'),?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, vo.getPrice());
			pstmt.setString(2, vo.getDestination());
			pstmt.setLong(3, vo.getCustomerNo());
			

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
	
	public List<OrderVo> findAll() {
		List<OrderVo> result = new ArrayList<>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = new Connect().getConnection();

			String sql = "select * from delivery";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Long no = rs.getLong(1);
				String deliveryNo = rs.getString(2);
				Long price = rs.getLong(3);
				String destination = rs.getString(4);
				Long customerNo = rs.getLong(5);

				OrderVo vo = new OrderVo();
				vo.setNo(no);
				vo.setOrderNo(deliveryNo);
				vo.setPrice(price);
				vo.setDestination(destination);
				vo.setCustomerNo(customerNo);
				
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