package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 用户数据库的处理
 */
public class UserDao {
	public User login(String userId) throws Exception {

		// 获取数据库操作链接
		Connection connection = DBUtils.getConnection();

		// 创建statement并执行sql
		String sql = "SELECT * FROM users WHERE userId = ? ";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, userId);
		// 获取数据集
		ResultSet resultSet = statement.executeQuery();

		// 创建一个空的user用于接收查询到的数据
		User user = null;

		// 处理结果集
		while (resultSet.next()) {
			user = new User();
			user.setUserId(resultSet.getString("userId"));
			user.setPassword(resultSet.getString("password"));
//			System.out.println(user);
		}

		// 5.关闭资源
		DBUtils.close(resultSet, statement, connection);

		return user;
	}

	/**
	 * 用户注册
	 */
	public int register(User user) throws SQLException{
		// 获取链接
		Connection connection = DBUtils.getConnection();
		String sql = "INSERT INTO users (userId,password) VALUES (?,?)";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, user.getUserId());
		statement.setString(2, user.getPassword());
		// 执行sql语句，如果成功添加数据，row>0
		int row = statement.executeUpdate();
		// 关闭资源
		DBUtils.close(null, statement, connection);

		// 返回数据
		return row;
	}

}