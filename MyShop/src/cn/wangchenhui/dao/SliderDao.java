package cn.wangchenhui.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
			pstat.setInt(4,sliderImg.getDisplay_count());
			pstat.setDate(5, (Date) sliderImg.getPost_date());
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
}
