package cn.wangchenhui.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.wangchenhui.model.Address;
import cn.wangchenhui.util.DBConnection;

/** 
 * @author  Dust 
 * @date 2016-3-17 上午8:38:31 
 * @version 1.0 
 */
public class AddressDao implements IAddressDao{

	@Override
	public void add(Address address, int user_id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstat = null;
		String sql = "insert into address values(null,?,?,?,?) where user_id =?";
		conn = DBConnection.getConnection();
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, address.getAddress());
			pstat.setInt(2, user_id);
			pstat.setString(3, address.getTelphone());
			pstat.setString(4, address.getName());
			pstat.setInt(5, user_id);
			pstat.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnection.close(conn);
			DBConnection.close(pstat);
		}
		
	}

	@Override
	public void update(Address address, int user_id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstat = null;
		String sql = "update address set address=?,telphone=?,name=? where user_id =?";
		conn = DBConnection.getConnection();
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, address.getAddress());
			pstat.setString(2, address.getTelphone());
			pstat.setString(3, address.getName());
			pstat.setInt(4, user_id);
			pstat.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnection.close(conn);
			DBConnection.close(pstat);
		}
		
	}

	@Override
	public Address load(int user_id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstat = null;
		ResultSet rs = null;
		String sql = "select * from address where user_id =?";
		Address address = null;
		conn = DBConnection.getConnection();
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, user_id);
			rs = pstat.executeQuery();
			while(rs.next()){
				address = new Address();
				address.setId(rs.getInt("id"));
				address.setAddress(rs.getString("address"));
				address.setUser_id(rs.getInt("user_id"));
				address.setTelphone(rs.getString("telphone"));
				address.setName(rs.getString("name"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnection.close(conn);
			DBConnection.close(pstat);
			DBConnection.close(rs);
		}
		
		return address;
	}
	
}
