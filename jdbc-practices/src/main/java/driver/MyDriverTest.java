package driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyDriverTest {

	public static void main(String[] args) {
		Connection conn = null;
		try {
			// 1. JDBC Driver Loading
			Class.forName("driver.MyDriver");

			// 2. 연결하기
			String url = "jdbc:mydb://127.0.0.1:2202/webdb";
			conn = DriverManager.getConnection(url, "webdb", "webdb");

			// 3. 연결성공
			System.out.println("ok: " + conn);
		} catch (ClassNotFoundException e) {
			System.out.println("Driver loading failure" + e);
		} catch (SQLException e) {
			System.out.println("SQL Exception " + e);
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
