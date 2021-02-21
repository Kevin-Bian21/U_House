package controller;
/**
 * @author Kevin
 * @Data 2020/12/29
 */
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import Dao.User;
import service.UserService;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 创建UserService对象
	private UserService userService = new UserService();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**
		 * 1. 获取参数 2. 验证用户 3. 返回结果
		 */

		/**
		 * 1.获取参数
		 * request.getParameter("useId");这里面的参数userId就是前端<input>标签中的userId
		 */
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");

		// 调用userService对象中的login方法验证登录用户
		User user = userService.login(userId,password);
		response.setContentType("text/html;charset=utf-8");
		response.setContentType("text/xml; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (user != null) {

			out.print("1");
			out.close();
//			response.sendRedirect("index.jsp");
			System.out.println("登录成功");
			/*
			 * 创建一个session用来存储user
			 * session是javaweb中一个负责存储数据的，相当于你的钥匙包，此时的user便是其中的一个钥匙，
			 * 将user存入包内，需要的时候在取出来，在前端jsp页面非常好用，不明白的同学可以去学一下这里就不赘述了
			 * */
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			request.getRequestDispatcher("index.jsp").forward(request, response);// 转发

			// 登录成功后，通过转发跳转到新的界面，当然也可以使用重定向，我们这里为了简单采用转发,若是想转发其他界面只要修改loginSuccess.jsp即可

		} else {
//			System.out.println("登陆失败");
			out.print("0");
			out.close();
			// 登录失败通过转发，在回到登录界面继续进行登录
//			request.getRequestDispatcher().forward(request, response);// 转发
		}
	}
}

