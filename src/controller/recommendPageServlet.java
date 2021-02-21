package controller;

/**
 * @author Kevin
 * @Data 2021/1/13
 */

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
import java.lang.reflect.Type;
import java.util.ArrayList;

@WebServlet("/recommendPageServlet")
public class recommendPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public recommendPageServlet(){
	    super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	HouseDao hd = new HouseDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

         response.setContentType("text/html; charset=utf-8");
         PrintWriter out = response.getWriter();
         request.setCharacterEncoding("utf8");


        String block = request.getParameter("block");
        String minPrice =request.getParameter("minPrice");
        String maxPrice = request.getParameter("maxPrice");
        String minArea = request.getParameter("minArea");
        String maxArea = request.getParameter("maxArea");
        String houseType = request.getParameter("houseType");

        float MinPrice = Float.parseFloat(minPrice);
        float MaxPrice = Float.parseFloat(maxPrice);
        float MinArea = Float.parseFloat(minArea);
        float MaxArea = Float.parseFloat(maxArea);

        System.out.println(block);
        System.out.println(houseType);
        System.out.println(MinPrice);
        System.out.println(MaxPrice);
        ArrayList<House> list =  hd.recommend(block,houseType,MinPrice,MaxPrice,MinArea,MaxArea);
        String jsonStr = JSON.toJSONString(list);
        out.print(jsonStr);
        out.close();
        System.out.println("jsonStr:" + jsonStr);
    }
}

