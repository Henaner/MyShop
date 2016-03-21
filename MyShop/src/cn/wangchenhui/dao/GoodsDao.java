package cn.wangchenhui.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.wangchenhui.model.Goods;
import cn.wangchenhui.model.Pager;
import cn.wangchenhui.model.SystemContext;
import cn.wangchenhui.util.DBConnection;

/** 
 * @author  Dust 
 * @date 2016-3-16 上午10:17:43 
 * @version 1.0 
 */
public class GoodsDao implements IGoodsDao{

	@Override
	public void add(Goods goods) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstat = null;
		String sql = "insert into goods values(?,?,?,?,?,?,?,?,?,?,?)";
		conn = DBConnection.getConnection();
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1,goods.getGoods_id());
			pstat.setString(2,goods.getGoods_title());
			pstat.setString(3, goods.getImg_name());
			pstat.setString(4,goods.getGoods_desc());
			pstat.setFloat(5, goods.getPrice());
			pstat.setInt(6,goods.getStock());
			pstat.setString(7,goods.getPost_date());
			pstat.setString(8,goods.getGoods_type());
			pstat.setInt(9,goods.getCurr_stock());
			pstat.setInt(10, goods.getUser_id());
			pstat.setString(11, goods.getGoods_status());
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
	public void update(Goods goods) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstat = null;
		String goods_id = goods.getGoods_id();
		String sql = "update goods set goods_title=?,img_name=?,goods_desc=?,price=?,stock=?,post_date=?,goods_type=?,curr_stock=?,user_id=?,goods_status=? where goods_id =?";
		conn = DBConnection.getConnection();
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1,goods.getGoods_title());
			pstat.setString(2,goods.getImg_name());
			pstat.setString(3,goods.getGoods_title());
			pstat.setFloat(4,goods.getPrice());
			pstat.setInt(5,goods.getStock());
			pstat.setString(6,goods.getPost_date());
			pstat.setString(7,goods.getGoods_type());
			pstat.setInt(8,goods.getCurr_stock());
			pstat.setInt(9,goods.getUser_id());
			pstat.setString(10,goods.getGoods_status());
			pstat.setString(11,goods_id);
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
	public void delete(String goods_id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstat = null;
		String sql = "delete from goods where goods_id =?";
		conn = DBConnection.getConnection();
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1,goods_id);
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
	public Goods load(String goods_id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstat = null;
		ResultSet rs = null;
		Goods goods = null;
		String sql = "select * from goods where goods_id =?";
		conn = DBConnection.getConnection();
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1,goods_id);
			rs = pstat.executeQuery();
			while(rs.next()){
				goods = new Goods();
				goods.setGoods_id(rs.getString("goods_id"));
				goods.setGoods_title(rs.getString("goods_title"));
				goods.setImg_name(rs.getString("img_name"));
				goods.setGoods_desc(rs.getString("goods_desc"));
				goods.setPrice(rs.getFloat("price"));
				goods.setStock(rs.getInt("stock"));
				goods.setPost_date(rs.getString("post_date"));
				goods.setGoods_type(rs.getString("goods_type"));
				goods.setUser_id(rs.getInt("user_id"));
				goods.setCurr_stock(rs.getInt("curr_stock"));
				goods.setGoods_status(rs.getString("goods_status"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnection.close(conn);
			DBConnection.close(pstat);
			DBConnection.close(rs);
		}
		return goods;
		
	}
	public List<Goods> getTop6(String type){
		Connection conn = null;
		PreparedStatement pstat = null;
		ResultSet rs = null;
		Goods goods = null;
		List<Goods> list = new ArrayList<Goods>();
		String sql = "select * from goods where goods_type =? order by str_to_date(post_date, '%Y-%m-%d %k:%i:%s') desc limit 0,6";
		conn = DBConnection.getConnection();
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1,type);
			rs = pstat.executeQuery();
			while(rs.next()){
				goods = new Goods();
				goods.setGoods_id(rs.getString("goods_id"));
				goods.setGoods_title(rs.getString("goods_title"));
				goods.setImg_name(rs.getString("img_name"));
				goods.setGoods_desc(rs.getString("goods_desc"));
				goods.setPrice(rs.getFloat("price"));
				goods.setStock(rs.getInt("stock"));
				goods.setPost_date(rs.getString("post_date"));
				goods.setGoods_type(rs.getString("goods_type"));
				goods.setUser_id(rs.getInt("user_id"));
				goods.setCurr_stock(rs.getInt("curr_stock"));
				goods.setGoods_status(rs.getString("goods_status"));
				list.add(goods);
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
	public Pager<Goods> list(String condition) {
		// TODO Auto-generated method stub
		Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pstat = null;
        Goods goods = null;
        Pager<Goods> pages = new Pager<Goods>();
        int pageOffset = SystemContext.getPageOffset();
        int pageSize = SystemContext.getPageSize();
        List<Goods> list = new ArrayList<Goods>();
        try{

            int start = pageOffset;
            conn = DBConnection.getConnection();
            String sql = "select * from goods";
            String sqlCount = "select count(*) from goods";
            if(condition != null || !"".equals(condition.trim())){
                sql+=" where goods_title like'%"+condition+"%'";
                sqlCount+=" where goods_title  like'%"+condition+"%'";
            }
            sql += " limit ?,?";
            pstat = conn.prepareStatement(sql);
            pstat.setInt(1,start);
            pstat.setInt(2,pageSize);

            rs = pstat.executeQuery();
            while(rs.next()){
            	goods = new Goods();
            	goods.setGoods_id(rs.getString("goods_id"));
				goods.setGoods_title(rs.getString("goods_title"));
				goods.setImg_name(rs.getString("img_name"));
				goods.setGoods_desc(rs.getString("goods_desc"));
				goods.setPrice(rs.getFloat("price"));
				goods.setStock(rs.getInt("stock"));
				goods.setPost_date(rs.getString("post_date"));
				goods.setGoods_type(rs.getString("goods_type"));
				goods.setUser_id(rs.getInt("user_id"));
				goods.setCurr_stock(rs.getInt("curr_stock"));
				goods.setGoods_status(rs.getString("goods_status"));
                list.add(goods);
            }
            /*计数*/
            pstat = conn.prepareStatement(sqlCount);
            rs = pstat.executeQuery();
            int totalRecord = 0;
            while(rs.next()){
                totalRecord = rs.getInt(1);
            }
            int totalPage = (totalRecord-1)/pageSize+1;
            pages.setPageOffset(pageOffset);
            pages.setPageSize(pageSize);
            pages.setTotalRecord(totalRecord);
            pages.setTotalPage(totalPage);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBConnection.close(conn);
            DBConnection.close(pstat);
            DBConnection.close(rs);
        }
        pages.setData(list);
        return pages;
	}

	@Override
	public Pager<Goods> hot_or_new(String condition) {
		// TODO Auto-generated method stub
		Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pstat = null;
        Goods goods = null;
        Pager<Goods> pages = new Pager<Goods>();
        int pageOffset = SystemContext.getPageOffset();
        int pageSize = SystemContext.getPageSize();
        List<Goods> list = new ArrayList<Goods>();
        try{
        	if(condition.equals("1")){
        		condition="热";
        	}
        	if(condition.equals("2")){
        		condition="新";
        	}
            int start = pageOffset;
            conn = DBConnection.getConnection();
            String sql = "select * from goods";
            String sqlCount = "select count(*) from goods";
            if(condition != null || !"".equals(condition.trim())){
                sql+=" where goods_type='"+condition+"'";
                sqlCount+=" where where goods_type='"+condition+"'";
            }
            sql += " limit ?,?";
            pstat = conn.prepareStatement(sql);
            pstat.setInt(1,start);
            pstat.setInt(2,pageSize);

            rs = pstat.executeQuery();
            while(rs.next()){
            	goods = new Goods();
            	goods.setGoods_id(rs.getString("goods_id"));
				goods.setGoods_title(rs.getString("goods_title"));
				goods.setImg_name(rs.getString("img_name"));
				goods.setGoods_desc(rs.getString("goods_desc"));
				goods.setPrice(rs.getFloat("price"));
				goods.setStock(rs.getInt("stock"));
				goods.setPost_date(rs.getString("post_date"));
				goods.setGoods_type(rs.getString("goods_type"));
				goods.setUser_id(rs.getInt("user_id"));
				goods.setCurr_stock(rs.getInt("curr_stock"));
				goods.setGoods_status(rs.getString("goods_status"));
                list.add(goods);
            }
            /*计数*/
            pstat = conn.prepareStatement(sqlCount);
            rs = pstat.executeQuery();
            int totalRecord = 0;
            while(rs.next()){
                totalRecord = rs.getInt(1);
            }
            int totalPage = (totalRecord-1)/pageSize+1;
            pages.setPageOffset(pageOffset);
            pages.setPageSize(pageSize);
            pages.setTotalRecord(totalRecord);
            pages.setTotalPage(totalPage);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBConnection.close(conn);
            DBConnection.close(pstat);
            DBConnection.close(rs);
        }
        pages.setData(list);
        return pages;
	}
	
}
