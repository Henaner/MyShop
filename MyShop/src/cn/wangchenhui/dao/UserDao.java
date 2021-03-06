package cn.wangchenhui.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.wangchenhui.model.Pager;
import cn.wangchenhui.model.ShopException;
import cn.wangchenhui.model.SystemContext;
import cn.wangchenhui.model.User;
import cn.wangchenhui.util.DBConnection;

public class UserDao implements IUserDao{

	@SuppressWarnings("resource")
	@Override
	public void add(User user) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstat = null;
		ResultSet rs = null;
		conn = DBConnection.getConnection();
		String querySql = "select count(*) from user where user_name=?";
		try {
			pstat = conn.prepareStatement(querySql);
			pstat.setString(1,user.getUser_name());
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
			pstat.setString(4,user.getBirthday());
			pstat.setString(5,user.getAddress());
			pstat.setString(6,user.getTelphone());
			pstat.setString(7,user.getEmail());
			pstat.setString(8,user.getType());
			pstat.setString(9,user.getStatus());
			pstat.setString(10,user.getIs_operator());
			pstat.setString(11,user.getOpt_status());
			pstat.setString(12,user.getIs_admin());
			pstat.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnection.close(conn);
			DBConnection.close(pstat);
			DBConnection.close(rs);
		}
	}

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstat = null;
		conn = DBConnection.getConnection();
		int id = user.getUser_id();
		String sql = "update user set user_name=?,user_pass=?,user_gender=?,birthday=?,address=?,telphone=?,email=?,type=?,status=?,is_operator=?,opt_status=?,is_admin=? where user_id = ?";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, user.getUser_name());
			pstat.setString(2, user.getUser_pass());
			pstat.setString(3, user.getUser_gender());
			pstat.setString(4, user.getBirthday());
			pstat.setString(5, user.getAddress());
			pstat.setString(6, user.getTelphone());
			pstat.setString(7, user.getEmail());
			pstat.setString(8, user.getType());
			pstat.setString(9, user.getStatus());
			pstat.setString(10, user.getIs_operator());
			pstat.setString(11, user.getOpt_status());
			pstat.setString(12, user.getIs_admin());
			pstat.setInt(13, id);
			pstat.executeUpdate();
			System.out.println(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnection.close(conn);
			DBConnection.close(pstat);
		}
		
	}

	@Override
	public void delete(int user_id) {
		// TODO Auto-generated method stub
		
	}

	
	public User login(String user_name) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		User user = null;
		conn = DBConnection.getConnection();
		String sql = "select * from user where user_name =? ";
		try {
			stat = conn.prepareStatement(sql);
			stat.setString(1, user_name);
			rs = stat.executeQuery();
			while(rs.next()){
				user = new User();
				user.setUser_id(rs.getInt("user_id"));
				user.setUser_name(rs.getString("user_name"));
				user.setUser_pass(rs.getString("user_pass"));
				user.setUser_gender(rs.getString("user_gender"));
				user.setBirthday(rs.getString("birthday"));
				user.setAddress(rs.getString("address"));
				user.setTelphone(rs.getString("telphone"));
				user.setEmail(rs.getString("email"));
				user.setType(rs.getString("type"));
				user.setStatus(rs.getString("status"));
				user.setIs_operator(rs.getString("is_operator"));
				user.setOpt_status(rs.getString("opt_status"));
				user.setIs_admin(rs.getString("is_admin"));
			}
			
			//判断一下用户的状态
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnection.close(conn);
			DBConnection.close(rs);
			DBConnection.close(stat);
		}
		return user;
	}

	public User login(String user_name, String user_pass) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		User user = null;
		conn = DBConnection.getConnection();
		String sql = "select * from user where user_name =? ";
		try {
			stat = conn.prepareStatement(sql);
			stat.setString(1, user_name);
			rs = stat.executeQuery();
			while(rs.next()){
				user = new User();
				user.setUser_id(rs.getInt("user_id"));
				user.setUser_name(rs.getString("user_name"));
				user.setUser_pass(rs.getString("user_pass"));
				user.setUser_gender(rs.getString("user_gender"));
				user.setBirthday(rs.getString("birthday"));
				user.setAddress(rs.getString("address"));
				user.setTelphone(rs.getString("telphone"));
				user.setEmail(rs.getString("email"));
				user.setType(rs.getString("type"));
				user.setStatus(rs.getString("status"));
				user.setIs_operator(rs.getString("is_operator"));
				user.setOpt_status(rs.getString("opt_status"));
				user.setIs_admin(rs.getString("is_admin"));
			}
			
			//判断一下用户的状态
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnection.close(conn);
			DBConnection.close(rs);
			DBConnection.close(stat);
		}
		return user;
	}
	@Override
	public User load(int user_id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstat = null;
		ResultSet rs = null;
		User user = null;
		conn = DBConnection.getConnection();
		String sql = "select * from user where user_id=?";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, user_id);
			rs = pstat.executeQuery();
			while(rs.next()){
				user = new User();
				user.setUser_id(rs.getInt("user_id"));
				user.setUser_name(rs.getString("user_name"));
				user.setUser_pass(rs.getString("user_pass"));
				user.setUser_gender(rs.getString("user_gender"));
				user.setAddress(rs.getString("address"));
				user.setBirthday(rs.getString("birthday"));
				user.setTelphone(rs.getString("telphone"));
				user.setEmail(rs.getString("email"));
				user.setType(rs.getString("type"));
				user.setStatus(rs.getString("status"));
				user.setIs_operator(rs.getString("is_operator"));
				user.setIs_admin(rs.getString("is_admin"));
				user.setOpt_status(rs.getString("opt_status"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnection.close(conn);
			DBConnection.close(pstat);
			DBConnection.close(rs);
		}
		return user;
	}

	@Override
	public Pager<User> list(String condition) {   //到时候这个里面可以传入筛选的条件
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement  pstat = null;
		ResultSet rs = null;
		User user = null;
		Pager<User> pages = new Pager<User>();
		int pageSize = SystemContext.getPageSize();
		int pageOffset = SystemContext.getPageOffset();
		List<User> list = new ArrayList<User>();
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from user ";
            String sqlCount = "select count(*) from user";
            if(condition != null || !"".equals(condition.trim())){
                sql+=" where user_name like'%"+condition+"%'";
                sqlCount+=" where user_name  like'%"+condition+"%'";
            }
            sql += " limit ?,?";
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, pageOffset);
			pstat.setInt(2, pageSize);
			rs = pstat.executeQuery();
			while(rs.next()){
				user = new User();
				user.setUser_id(rs.getInt("user_id"));
				user.setUser_name(rs.getString("user_name"));
				user.setUser_pass(rs.getString("user_pass"));
				user.setUser_gender(rs.getString("user_gender"));
				user.setBirthday(rs.getString("birthday"));
				user.setTelphone(rs.getString("telphone"));
				user.setAddress(rs.getString("address"));
				user.setEmail(rs.getString("email"));
				user.setType(rs.getString("type"));
				user.setStatus(rs.getString("status"));
				user.setIs_operator(rs.getString("is_operator"));
				user.setOpt_status(rs.getString("opt_status"));
				user.setIs_admin(rs.getString("is_admin"));
				list.add(user);
			}
			/*计数*/
            pstat = conn.prepareStatement(sqlCount);
			rs = pstat.executeQuery();
			rs = pstat.executeQuery();
			int totalRecord = 0;
			while(rs.next()){
				totalRecord = rs.getInt(1);
			}
			int totalPage = (totalRecord-1)/pageSize+1;
			pages.setTotalRecord(totalRecord);
			pages.setTotalPage(totalPage);
			pages.setPageSize(pageSize);
			pages.setPageOffset(pageOffset);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnection.close(conn);
			DBConnection.close(pstat);
			DBConnection.close(rs);
		}
		pages.setData(list);
		return pages;
	}
	
	//操作员
	public Pager<User> optList(String condition) {   //到时候这个里面可以传入筛选的条件
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement  pstat = null;
		ResultSet rs = null;
		User user = null;
		Pager<User> pages = new Pager<User>();
		int pageSize = SystemContext.getPageSize();
		int pageOffset = SystemContext.getPageOffset();
		List<User> list = new ArrayList<User>();
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from user where is_operator='Y' ";
            String sqlCount = "select count(*) from user where is_operator='Y'";
            if(condition != null || !"".equals(condition.trim())){
                sql+=" and  user_name like'%"+condition+"%'";
                sqlCount+=" and user_name  like'%"+condition+"%'";
            }
            sql += " limit ?,?";
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, pageOffset);
			pstat.setInt(2, pageSize);
			rs = pstat.executeQuery();
			while(rs.next()){
				user = new User();
				user.setUser_id(rs.getInt("user_id"));
				user.setUser_name(rs.getString("user_name"));
				user.setUser_pass(rs.getString("user_pass"));
				user.setUser_gender(rs.getString("user_gender"));
				user.setBirthday(rs.getString("birthday"));
				user.setTelphone(rs.getString("telphone"));
				user.setAddress(rs.getString("address"));
				user.setEmail(rs.getString("email"));
				user.setType(rs.getString("type"));
				user.setStatus(rs.getString("status"));
				user.setIs_operator(rs.getString("is_operator"));
				user.setOpt_status(rs.getString("opt_status"));
				user.setIs_admin(rs.getString("is_admin"));
				list.add(user);
			}
			/*计数*/
            pstat = conn.prepareStatement(sqlCount);
			rs = pstat.executeQuery();
			int totalRecord = 0;
			while(rs.next()){
				totalRecord = rs.getInt(1);
			}
			int totalPage = (totalRecord-1)/pageSize+1;
			pages.setTotalRecord(totalRecord);
			pages.setTotalPage(totalPage);
			pages.setPageSize(pageSize);
			pages.setPageOffset(pageOffset);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnection.close(conn);
			DBConnection.close(pstat);
			DBConnection.close(rs);
		}
		pages.setData(list);
		return pages;
	}
	
}
