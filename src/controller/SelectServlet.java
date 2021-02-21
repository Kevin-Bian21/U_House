package controller;

import Dao.House;
import Dao.HouseDao;
//import service.HouseService;

import java.awt.geom.Area;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.stream.Location;

@WebServlet("/SelectServlet")
public class SelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public SelectServlet(){
	    super();
    }
    HouseDao hd = new HouseDao();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         response.setContentType("text/html; charset=utf-8");
         PrintWriter out = response.getWriter();
         request.setCharacterEncoding("utf8");
         String town1 = request.getParameter("town1");
         String town2 =request.getParameter("town2");
         String house1 =request.getParameter("townHouse1");
         String house2 =request.getParameter("townHouse2");
//         System.out.println(town1);
//        System.out.println(house1);
//         System.out.println(town2);
//        System.out.println(house2);
        House h1 = hd.find(town1);
        House h2 = hd.find(house1);
        House h3 = hd.find(town2);
        House h4 = hd.find(house2);



//        System.out.println(house.getTown()+house.getPrice());
//        request.setAttribute();
//        out.println("城区 "+h1.getTown()+"房价"+h1.getPrice());
//        out.println("城区 "+h2.getTown()+"房价"+h2.getPrice());
          request.setAttribute("town1",h1.getTown());
          request.setAttribute("house1",h2.getTown());
          request.setAttribute("town2",h3.getTown());
          request.setAttribute("house2",h4.getTown());
          request.setAttribute("price1",h2.getPrice());
          request.setAttribute("price2",h4.getPrice());
          request.setAttribute("townPrice1",h1.getPrice());
          request.setAttribute("townPrice2",h3.getPrice());
          request.setAttribute("location1",h2.getLocation());
          request.setAttribute("location2",h4.getLocation());
          request.setAttribute("area1",h2.getArea());
          request.setAttribute("area2",h4.getArea());
          request.setAttribute("houseType1",h2.getHouseType());
          request.setAttribute("houseType2",h4.getHouseType());
          request.getRequestDispatcher("/Form.jsp").forward(request, response);// 转发
    }
}

