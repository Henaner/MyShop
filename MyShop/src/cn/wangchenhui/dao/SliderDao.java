package cn.wangchenhui.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.wangchenhui.model.SliderImg;
import cn.wangchenhui.util.DBConnection;

/** 
 * @author  Dust 
 * @date 2016-3-6 下午6:40:14 
 * @version 1.0 
 */
public class SliderDao implements ISliderDao{
	public void addSliderImg(SliderImg  sliderImg){
		Connection conn = null;
		PreparedStatement pstat = null;
		String sql =  "insert into slider_img values(null,?,?,?,?,?,?)";
		try {
			conn = DBConnection.getConnection();
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, sliderImg.getImg_title());
			pstat.setString(2,sliderImg.getImg_type());
			pstat.setString(3, sliderImg.getImg_path());
			pstat.setString(4,sliderImg.getGoods_id());
			pstat.setString(5,sliderImg.getPost_date());
			pstat.setInt(6, sliderImg.getUser_id());
			pstat.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnection.close(conn);
			DBConnection.close(pstat);
		}
		
	}
	
	
	//这里可能需要一个list
	@SuppressWarnings("null")
	public List<SliderImg> getSliderImg(){
		Connection conn = null;
		PreparedStatement pstat = null;
		ResultSet rs = null;
		List<SliderImg> list = new ArrayList<SliderImg>();
		SliderImg sliderImg = null;
		conn = DBConnection.getConnection();
		String sql = "select * from slider_img  order by img_id desc limit 0,3";
		try {
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			while(rs.next()){
				sliderImg = new SliderImg();
				sliderImg.setImg_id(rs.getInt("img_id"));
				sliderImg.setImg_title(rs.getString("img_title"));
				sliderImg.setImg_path(rs.getString("img_path"));
				sliderImg.setImg_type(rs.getString("img_type"));
				sliderImg.setGoods_id(rs.getString("goods_id"));
				sliderImg.setPost_date(rs.getString("post_date"));
				sliderImg.setUser_id(rs.getInt("user_id"));
				list.add(sliderImg);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnection.close(conn);
			DBConnection.close(pstat);
			DBConnection.close(rs);
		}
		return list;
	}
}
