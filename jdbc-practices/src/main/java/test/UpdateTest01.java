package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class UpdateTest01 {

	public static void main(String[] args) {
		DeptVo vo = new DeptVo();
		vo.setNo(10L);
		vo.setName("회계팀");

		Boolean result = update(vo);
		System.out.println(result ? "성공" : "실패");

	}

	public static Boolean update(DeptVo vo) {
		Connection conn = null;
		Statement stmt = null;
		boolean result = false;
		try {
			// 1. JDBC 드라이버 로딩
			// new를 안해도 로딩이 됨
			Class.forName("org.mariadb.jdbc.Driver");

			// 2. DriverManager ( url , ID , PWD )
			// 연결하기
			String url = "jdbc:mysql://192.168.254.32:3307/employees?charset=utf8";
			conn = DriverManager.getConnection(url, "hr", "hr");

			// 3. Statement 생성
			stmt = conn.createStatement();

			// 4. SQL문을 실행
			String sql = "update dept" + " set name = '" + vo.getName() + "' where no =" + vo.getNo();
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
				if (stmt != null) {
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
