package Dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 数据库管理工具类
 * */

public  class  DBUtils {

	// 加载驱动
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 连接数据库
	 */
	public static Connection getConnection() throws SQLException {

		String url = "jdbc:mysql://58.87.124.55:3306/test?serverTimezone=GMT%2B8";
		Connection connection = DriverManager.getConnection(url, "root", "root");
		return connection;
	}

	// 关闭资源
	public static void close(ResultSet resultSet, Statement statement, Connection connection) throws SQLException {

		if (resultSet != null) {
			resultSet.close();
		}
		if (statement != null) {
			statement.close();
		}
		if (connection != null) {
			connection.close();
		}

	}
}
