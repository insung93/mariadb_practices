package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DeleteTest01 {

	public static void main(String[] args) {
		Boolean result = delete(8L);
		System.out.println(result ? "성공":"실패");
	}
	public static boolean delete(Long no) {
		Connection conn = null;
		Statement stmt = null;
		boolean result = false;
		try {
			// 1. JDBC 드라이버 로딩
			// new를 안해도 로딩이 됨
			Class.forName("org.mariadb.jdbc.Driver");

			// 2. DriverManager ( url , ID , PWD )
			//    연결하기
			String url = "jdbc:mysql://192.168.254.32:3307/employees?charset=utf8";
			conn = DriverManager.getConnection(url, "hr", "hr");
			
			// 3. Statement 생성
			stmt = conn.createStatement();
			
			// 4. SQL문을 실행
			String sql = 
					"delete" +
					" from dept" +
					" where no = '" + no + "'";
			int count = stmt.executeUpdate(sql);
			result = count == 1;
			
			// 3. 연결 성공
			System.out.println("ok:" + conn);
		} catch (ClassNotFoundException e) {
			System.out.println("Driver loading failure" + e);
		} catch (SQLException e) {
			System.out.println("SQL Exception " + e);
		} finally {
			try {
				if(stmt != null) {
					stmt.close();
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