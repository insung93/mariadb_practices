package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SelectTest {

	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
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
					"select emp_no, date_format(birth_date, '%Y-%m-%d'), last_name" +
					" from employees" +
					" where first_name like 'pat%'";
			
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				Long empNo = rs.getLong(1);
				String birthDate = rs.getString(2);
				String lastName = rs.getString(3);
				System.out.println(empNo+ "\t" + birthDate+ "\t" + lastName);
			}

			// 3. 연결 성공
			System.out.println("ok:" + conn);
		} catch (ClassNotFoundException e) {
			System.out.println("Driver loading failure" + e);
		} catch (SQLException e) {
			System.out.println("SQL Exception " + e);
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
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

	}

}
