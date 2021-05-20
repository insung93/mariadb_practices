package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UpdateTest02 {

	public static void main(String[] args) {
		DeptVo vo = new DeptVo();
		vo.setNo(12L);
		vo.setName("인사기획팀");

		Boolean result = update(vo);
		System.out.println(result ? "성공" : "실패");
	}
	public static boolean update(DeptVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		try {
			// 1. JDBC 드라이버 로딩
			// new를 안해도 로딩이 됨
			Class.forName("org.mariadb.jdbc.Driver");

			// 2. DriverManager ( url , ID , PWD )
			//    연결하기
			String url = "jdbc:mysql://192.168.254.32:3307/employees?charset=utf8";
			conn = DriverManager.getConnection(url, "hr", "hr");
			
			
			// 3. SQL문 준비
			String sql = 
					"update dept" +
					" set name = ?" +
					" where no = ?";
			pstmt = conn.prepareStatement(sql);
			
			// 4. 바인딩(binding)
			pstmt.setString(1, vo.getName());
			pstmt.setLong(2, vo.getNo());
			
			// 5. SQL 실행
			int count = pstmt.executeUpdate();
			result = count == 1;
			
			// 3. 연결 성공
			System.out.println("ok:" + conn);
		} catch (ClassNotFoundException e) {
			System.out.println("Driver loading failure" + e);
		} catch (SQLException e) {
			System.out.println("SQL Exception " + e);
		} finally {
			try {
				if(pstmt != null) {
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