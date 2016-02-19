package cn.wangchenhui.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.wangchenhui.model.Pager;
import cn.wangchenhui.model.ShopException;
import cn.wangchenhui.model.User;
import cn.wangchenhui.util.DBConnection;

public class UserDao implements IUserDao{

	@Override
	public void add(User user) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstat = null;
		ResultSet rs = null;
		conn = DBConnection.getConnection();
		String querySql = "select count(*) from user";
		try {
			pstat = conn.prepareStatement(querySql);
			rs = pstat.executeQuery();
			while(rs.next()){
				if(rs.getInt(1)>0){
					throw new ShopException("用户已存在！");
				}
			}
			String insertSql = "insert into user values(null,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstat = conn.prepareStatement(insertSql);
			pstat.setString(1,user.getUser_name());
			pstat.setString(2,user.getUser_pass());
			pstat.setString(3,user.getUser_gender());
			pstat.setDate(4,(Date) user.getBirthday());
			pstat.setString(5,user.getAddress());
			pstat.setString(6,user.getTelphone());
			pstat.setString(7,user.getEmail());
			pstat.setString(8,user.getType());
			pstat.setString(9,user.getStatus());
			pstat.setString(10,user.getIs_operator());
			pstat.setString(11,user.getOpt_status());
			pstat.setString(12,user.getIs_admin());
			pstat.executeUpdate();
			add(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int user_id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public User login(String user_name, String user_pass) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User load(int user_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pager<User> list() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
