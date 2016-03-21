package cn.wangchenhui.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.wangchenhui.model.Cart;
import cn.wangchenhui.model.Goods;
import cn.wangchenhui.model.Pager;
import cn.wangchenhui.model.SystemContext;
import cn.wangchenhui.model.User;
import cn.wangchenhui.util.DBConnection;

/** 
 * @author  Dust 
 * @date 2016-3-16 下午1:32:10 
 * @version 1.0 
 */
public class CartDao implements ICartDao{

	@Override
	public void add(Cart cart) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstat = null;
		String sql = "insert into cart values(null,?,?,?,?,?,?)";
		conn = DBConnection.getConnection();
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, cart.getUser_id());
			pstat.setString(2, cart.getGoods_id());
			pstat.setInt(3,cart.getCount());
			pstat.setFloat(4, cart.getAmount());
			pstat.setString(5, cart.getPost_date());
			pstat.setString(6, cart.getCart_status());
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
	public void update(Cart cart) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstat = null;
		String sql = "update cart set user_id=?,goods_id=?,count=?,amount=?,post_date=?,cart_status=? where id= ?";
		conn = DBConnection.getConnection();
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, cart.getUser_id());
			pstat.setString(2, cart.getGoods_id());
			pstat.setInt(3,cart.getCount());
			pstat.setFloat(4, cart.getAmount());
			pstat.setString(5, cart.getPost_date());
			pstat.setString(6, cart.getCart_status());
			pstat.setInt(7, cart.getId());
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
	public void delete(int id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstat = null;
		String sql = "delete from cart where id= ?";
		conn = DBConnection.getConnection();
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, id);
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
	public Pager<Cart> list() {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement  pstat = null;
		ResultSet rs = null;
		Cart cart = null;
		Pager<Cart> pages = new Pager<Cart>();
		int pageSize = SystemContext.getPageSize();
		int pageOffset = SystemContext.getPageOffset();
		List<Cart> list = new ArrayList<Cart>();
		try {
			conn = DBConnection.getConnection();
			String querySql = "select * from cart";
			querySql += " limit ?,?";
			pstat = conn.prepareStatement(querySql);
			pstat.setInt(1, pageOffset);
			pstat.setInt(2, pageSize);
			rs = pstat.executeQuery();
			while(rs.next()){
				cart = new Cart();
				cart.setId(rs.getInt("id"));
				cart.setUser_id(rs.getInt("user_id"));
				cart.setGoods_id(rs.getString("goods_id"));
				cart.setCount(rs.getInt("count"));
				cart.setAmount(rs.getFloat("amount"));
				cart.setCart_status(rs.getString("cart_status"));
				list.add(cart);
			}
			String countSql = "select count(*) from user ";
			pstat = conn.prepareStatement(countSql);
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
	public int getCount(int user_id){
		int count = 0;
		Connection conn = null;
		PreparedStatement pstat = null;
		ResultSet rs = null;
		String sql = "select count(*) from cart where user_id= ? and cart_status='未结算'";
		conn = DBConnection.getConnection();
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, user_id);
			rs = pstat.executeQuery();
			while(rs.next()){
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnection.close(conn);
			DBConnection.close(pstat);
		}
		return count;
	}

	@Override
	public List<Cart> getList(int user_id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement  pstat = null;
		ResultSet rs = null;
		Cart cart = null;
		List<Cart> list = new ArrayList<Cart>();
		try {
			conn = DBConnection.getConnection();
			String querySql = "select * from cart where user_id = ? and cart_status = '未结算'";
			pstat = conn.prepareStatement(querySql);
			pstat.setInt(1, user_id);
			rs = pstat.executeQuery();
			while(rs.next()){
				cart = new Cart();
				cart.setId(rs.getInt("id"));
				cart.setUser_id(rs.getInt("user_id"));
				cart.setGoods_id(rs.getString("goods_id"));
				cart.setCount(rs.getInt("count"));
				cart.setAmount(rs.getFloat("amount"));
				cart.setCart_status(rs.getString("cart_status"));
				list.add(cart);
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
	public int getAmout(int user_id) {
		// TODO Auto-generated method stub
		int amount = 0;
		Connection conn = null;
		PreparedStatement pstat = null;
		ResultSet rs = null;
		String sql = "select sum(amount) from cart where user_id= ? and cart_status='未结算'";
		conn = DBConnection.getConnection();
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, user_id);
			rs = pstat.executeQuery();
			while(rs.next()){
				amount = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnection.close(conn);
			DBConnection.close(pstat);
		}
		return amount;
	}
}
