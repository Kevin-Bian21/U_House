package controller;

import Dao.House;
import Dao.HouseDao;
import com.alibaba.fastjson.JSON;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/homepageServlet")
public class homepageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public homepageServlet(){
	    super();
    }
	HouseDao hd = new HouseDao();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    request.setCharacterEncoding("utf8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();

        String str = request.getParameter("city");
        System.out.println(str);

        ArrayList<House> list = hd.search(str);
        String jsonStr = JSON.toJSONString(list);
        out.print(jsonStr);
        out.close();
        System.out.println("jsonStr:" + jsonStr);

    }
}

