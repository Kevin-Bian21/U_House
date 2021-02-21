package Dao;

import com.sun.javafx.scene.control.skin.VirtualFlow;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class HouseDao {
    public House find(String hometown){
        try {

        Connection conn = DBUtils.getConnection();
        String sql = "SELECT * FROM showtown WHERE town = ? ";
        PreparedStatement sm = conn.prepareStatement(sql);
        sm.setString(1,hometown);
        // 获取数据集
        ResultSet rs = sm.executeQuery();

        while(rs.next()){
            House house = new House();
            house.setTown(rs.getString("town"));
            house.setPrice(rs.getFloat("price"));
            house.setLocation(rs.getString("location"));
            house.setArea(rs.getFloat("area"));
            house.setHouseType(rs.getString(5));
            return house;
        }
        DBUtils.close(rs, sm, conn);
      } catch (SQLException e) {
            e.printStackTrace();
      }
         return null;
    }
    public ArrayList<House> search(String city){
        ArrayList<House> list = new ArrayList<House>();
        try {
            Connection conn = DBUtils.getConnection();
            String sql = "SELECT * FROM "+city+"";
            PreparedStatement sm = conn.prepareStatement(sql);
//            sm.setString(1,city);
            // 获取数据集
            ResultSet rs = sm.executeQuery();
            while (rs.next()) {
                House house = new House();
                house.setTown(rs.getString("town"));
                house.setPrice(rs.getFloat("price"));
                house.setGrowth(rs.getFloat("growth"));
                house.setHistoryPrice(rs.getFloat(4));
                house.setForecast(rs.getFloat("forecast"));
                list.add(house);
            }
            DBUtils.close(rs, sm, conn);
            return list;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return  null;
    }

    public ArrayList<House> recommend(String block,String houseType,Float minPrice,Float maxPrice,Float minArea,Float maxArea){
           ArrayList<House> list = new ArrayList<House>();
        try {
            Connection conn = DBUtils.getConnection();
            String sql = "SELECT * FROM showtown where district = ? and house_type= ? and price> ? && price< ? and area< ? && area> ?";
            PreparedStatement sm = conn.prepareStatement(sql);
            sm.setString(1,block);
            sm.setString(2,houseType);
           sm.setFloat(3,minPrice);
           sm.setFloat(4,maxPrice);
           sm.setFloat(5,maxArea);
           sm.setFloat(6,minArea);
            // 获取数据集

            ResultSet rs = sm.executeQuery();
            while (rs.next()) {
                House house = new House();
                house.setTown(rs.getString("town"));
                house.setPrice(rs.getFloat("price"));
                house.setArea(rs.getFloat("area"));
                house.setLocation(rs.getString("location"));
                house.setHouseType(rs.getString("house_type"));
                house.setDistrict(rs.getString("district"));
                list.add(house);
            }
            DBUtils.close(rs, sm, conn);
            return list;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return  null;
    }
}
