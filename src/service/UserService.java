package service;

import java.sql.SQLException;

import Dao.User;
import Dao.UserDao;

/**
 * 业务层处理
 * */
public class UserService {
	// 创建UserDao对象
	private UserDao userDao = new UserDao();

	/**
	 * 登录操作
	 */
	public User login(String userId, String password) {
		// 声明一个用户实体类，用于接收返回的user
		User user = null;
		try {
			// 调用userDao中方法根据用户名查询是否存在该用户
			user = userDao.login(userId);

			if (!user.getPassword().equals(password)) {
				// 密码不相等时将user置为null
				System.out.println("密码不对");
				user = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 返回user数据
		return user;
	}

	/**
	 * 用户注册
	 */
	public int register(User user) {
		// 首先定义row=0，若有新用户注册，row>0,如果没有注册返回0
		int row = 0;
		try {
			row = userDao.register(user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return row;
	}

}
