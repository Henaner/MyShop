package cn.wangchenhui.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.wangchenhui.model.Order;
import cn.wangchenhui.model.Pager;
import cn.wangchenhui.model.SystemContext;
import cn.wangchenhui.model.User;
import cn.wangchenhui.util.DBConnection;

/** 
 * @author  Dust 
 * @date 2016-3-17 上午9:05:12 
 * @version 1.0 
 */
public class OrderDao implements IOrderDao {

	@Override
	public void add(Order order) {
		// TODO Auto-generated method stub
		Connection conn  = null;
		PreparedStatement pstat = null;
		String sql = "insert into user_ord values(null,?,?,?,?,?,?)";
		conn = DBConnection.getConnection();
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, order.getOrd_id());
			pstat.setInt(2, order.getUser_id());
			pstat.setString(3, order.getGoods_id());
			pstat.setString(4, order.getPost_date());
			pstat.setString(5,"0"); //0代表未发货的状态
			pstat.setFloat(6,order.getAmount());
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
	public void delete(String ord_id) {
		// TODO Auto-generated method stub
		Connection conn  = null;
		PreparedStatement pstat = null;
		String sql = "delete from user_ord where ord_id =? ";
		conn = DBConnection.getConnection();
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1,ord_id);
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
	public void update(Order order) {
		// TODO Auto-generated method stub
		Connection conn  = null;
		PreparedStatement pstat = null;
		String sql = "update user_ord set id=?,user_id=?,goods_id=?,post_date=?, ord_status = ? ,amount = ? where ord_id =?";
		conn = DBConnection.getConnection();
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, order.getId());
			pstat.setInt(2, order.getUser_id());
			pstat.setString(3, order.getGoods_id());
			pstat.setString(4, order.getPost_date());
			pstat.setString(5, order.getOrd_status());
			pstat.setFloat(6, order.getAmount());
			pstat.setString(7, order.getOrd_id());
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
	public Order load(String ord_id) {
		// TODO Auto-generated method stub
		Connection conn  = null;
		PreparedStatement pstat = null;
		String sql = "select * from user_ord where ord_id =?";
		ResultSet rs = null;
		Order order = null;
		conn = DBConnection.getConnection();
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, ord_id);
			rs = pstat.executeQuery();
			while(rs.next()){
				order = new Order();
				order.setId(rs.getInt("id"));
				order.setOrd_id(rs.getString("ord_id"));
				order.setGoods_id(rs.getString("goods_id"));
				order.setUser_id(rs.getInt("user_id"));
				order.setPost_date(rs.getString("post_date"));
				order.setOrd_status(rs.getString("ord_status"));
				order.setAmount(rs.getFloat("amount"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnection.close(conn);
			DBConnection.close(pstat);
			DBConnection.close(rs);
		}
		return order;
	}

	@Override
	public List<Order> list(int user_id) {
		// TODO Auto-generated method stub
		Connection conn  = null;
		PreparedStatement pstat = null;
		String sql = "select * from user_ord where user_id =?";
		ResultSet rs = null;
		Order order = null;
		List<Order> list = new ArrayList<Order>();
		conn = DBConnection.getConnection();
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, user_id);
			rs = pstat.executeQuery();
			while(rs.next()){
				order = new Order();
				order.setId(rs.getInt("id"));
				order.setOrd_id(rs.getString("ord_id"));
				order.setGoods_id(rs.getString("goods_id"));
				order.setUser_id(rs.getInt("user_id"));
				order.setPost_date(rs.getString("post_date"));
				order.setOrd_status(rs.getString("ord_status"));
				order.setAmount(rs.getFloat("amount"));
				list.add(order);
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
	public Pager<Order> list(String condition) {   //到时候这个里面可以传入筛选的条件
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement  pstat = null;
		ResultSet rs = null;
		Order order = null;
		Pager<Order> pages = new Pager<Order>();
		int pageSize = SystemContext.getPageSize();
		int pageOffset = SystemContext.getPageOffset();
		List<Order> list = new ArrayList<Order>();
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from user_ord  ";
            String sqlCount = "select count(*) from user_ord";
            if(condition != null || !"".equals(condition.trim())){
                sql+=" where ord_id like'%"+condition+"%' group by ord_id";
                sqlCount+=" where ord_id  like'%"+condition+"%' group by ord_id";
            }
            sql += " limit ?,?";
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, pageOffset);
			pstat.setInt(2, pageSize);
			rs = pstat.executeQuery();
			while(rs.next()){
				order = new Order();
				order.setId(rs.getInt("id"));
				order.setOrd_id(rs.getString("ord_id"));
				order.setGoods_id(rs.getString("goods_id"));
				order.setOrd_status(rs.getString("ord_status"));
				order.setPost_date(rs.getString("post_date"));
				order.setUser_id(rs.getInt("user_id"));
				order.setAmount(rs.getFloat("amount"));
				list.add(order);
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

	@Override
	public Pager<Order> getList(int user_id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement  pstat = null;
		ResultSet rs = null;
		Order order = null;
		Pager<Order> pages = new Pager<Order>();
		int pageSize = SystemContext.getPageSize();
		int pageOffset = SystemContext.getPageOffset();
		List<Order> list = new ArrayList<Order>();
		try {
			conn = DBConnection.getConnection();
			String sql = "select *,count(distinct ord_id) from user_ord";
            String sqlCount = " select count(*) from (select distinct ord_id from user_ord where user_id = "+user_id+") a ";
                sql+=" where user_id = "+user_id+" group by ord_id";
            sql += " limit ?,?";
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, pageOffset);
			pstat.setInt(2, pageSize);
			rs = pstat.executeQuery();
			while(rs.next()){
				order = new Order();
				order.setId(rs.getInt("id"));
				order.setOrd_id(rs.getString("ord_id"));
				order.setGoods_id(rs.getString("goods_id"));
				order.setOrd_status(rs.getString("ord_status"));
				order.setPost_date(rs.getString("post_date"));
				order.setUser_id(rs.getInt("user_id"));
				order.setAmount(rs.getFloat("amount"));
				list.add(order);
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

	@Override
	public List<Order> returnList(String ord_id) {
		// TODO Auto-generated method stub
		Connection conn  = null;
		PreparedStatement pstat = null;
		String sql = "select * from user_ord where ord_id =?";
		ResultSet rs = null;
		Order order = null;
		List<Order> list = new ArrayList<Order>();
		conn = DBConnection.getConnection();
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, ord_id);
			rs = pstat.executeQuery();
			while(rs.next()){
				order = new Order();
				order.setId(rs.getInt("id"));
				order.setOrd_id(rs.getString("ord_id"));
				order.setGoods_id(rs.getString("goods_id"));
				order.setUser_id(rs.getInt("user_id"));
				order.setPost_date(rs.getString("post_date"));
				order.setOrd_status(rs.getString("ord_status"));
				order.setAmount(rs.getFloat("amount"));
				list.add(order);
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
	public List<Order> commentList(String goods_id){
		Connection conn  = null;
		PreparedStatement pstat = null;
		String sql = "select * from user_ord where goods_id =? group by ord_id order by id desc limit 0,3 ";
		ResultSet rs = null;
		Order order = null;
		List<Order> list = new ArrayList<Order>();
		conn = DBConnection.getConnection();
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, goods_id);
			rs = pstat.executeQuery();
			while(rs.next()){
				order = new Order();
				order.setId(rs.getInt("id"));
				order.setOrd_id(rs.getString("ord_id"));
				order.setGoods_id(rs.getString("goods_id"));
				order.setUser_id(rs.getInt("user_id"));
				order.setPost_date(rs.getString("post_date"));
				order.setOrd_status(rs.getString("ord_status"));
				order.setAmount(rs.getFloat("amount"));
				list.add(order);
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

	@Override
	public Map<String, Integer> getTop3() {
		// TODO Auto-generated method stub
		Connection conn  = null;
		PreparedStatement pstat = null;
		String sql = "select count(goods_id) as count ,goods_id as goods_id from user_ord group by goods_id order by count(goods_id) desc limit 0,3;";
		ResultSet rs = null;
		Map<String,Integer> map = new HashMap<String,Integer>();
		conn = DBConnection.getConnection();
		try {
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			while(rs.next()){
				map.put(rs.getString("goods_id"), rs.getInt("count"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnection.close(conn);
			DBConnection.close(pstat);
			DBConnection.close(rs);
		}
		return map;
	}


}
