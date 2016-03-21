package cn.wangchenhui.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sun.corba.se.spi.presentation.rmi.PresentationDefaults;

import cn.wangchenhui.model.Comment;
import cn.wangchenhui.model.Pager;
import cn.wangchenhui.model.SystemContext;
import cn.wangchenhui.model.User;
import cn.wangchenhui.util.DBConnection;

/** 
 * @author  Dust 
 * @date 2016-3-17 下午6:27:03 
 * @version 1.0 
 */
public class CommentDao implements ICommentDao{

	@Override
	public void add(Comment comment) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstat = null;
		String sql = "insert into user_comment values(null,?,?,?,?,?,?) ";
		conn = DBConnection.getConnection();
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, comment.getUser_id());
			pstat.setString(2, comment.getOrd_id());
			pstat.setString(3, comment.getEval_rank());
			pstat.setString(4,comment.getAdvice());
			pstat.setString(5, comment.getPost_date());
			pstat.setString(6, comment.getReply());
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
		String sql = "delete from  user_comment where id =? ";
		conn = DBConnection.getConnection();
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1,id);
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
	public List<Comment> getTop6(String ord_id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstat = null;
		ResultSet rs = null;
		Comment comment = null;
		List<Comment> list = new ArrayList<Comment>();
		String sql = "delete from  user_comment where ord_id = ? order by id desc limit 0,6";
		conn = DBConnection.getConnection();
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, ord_id);
			rs = pstat.executeQuery();
			while(rs.next()){
				comment = new Comment();
				comment.setId(rs.getInt("id"));
				comment.setOrd_id(rs.getString("ord_id"));
				comment.setUser_id(rs.getInt("user_id"));
				comment.setEval_rank(rs.getString("eval_rank"));
				comment.setAdvice(rs.getString("advice"));
				comment.setPost_date(rs.getString("post_date"));
				list.add(comment);
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
	public Pager<Comment> list(String condition) {   //到时候这个里面可以传入筛选的条件
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement  pstat = null;
		ResultSet rs = null;
		Comment comment = null;
		Pager<Comment> pages = new Pager<Comment>();
		int pageSize = SystemContext.getPageSize();
		int pageOffset = SystemContext.getPageOffset();
		List<Comment> list = new ArrayList<Comment>();
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from user_comment ";
            String sqlCount = "select count(*) from user_comment";
            if(condition != null || !"".equals(condition.trim())){
                sql+=" where ord_id like'%"+condition+"%'";
                sqlCount+=" where ord_id  like'%"+condition+"%'";
            }
            sql += " limit ?,?";
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, pageOffset);
			pstat.setInt(2, pageSize);
			rs = pstat.executeQuery();
			while(rs.next()){
				comment = new Comment();
				comment.setId(rs.getInt("id"));
				comment.setOrd_id(rs.getString("ord_id"));
				comment.setUser_id(rs.getInt("user_id"));
				comment.setEval_rank(rs.getString("eval_rank"));
				comment.setAdvice(rs.getString("advice"));
				comment.setPost_date(rs.getString("post_date"));
				comment.setReply(rs.getString("reply"));
				list.add(comment);
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
	public void update(Comment comment) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstat = null;
		String sql = "update user_comment set user_id=?,ord_id=?,advice=?,post_date=?,reply=? where id=?";
		conn = DBConnection.getConnection();
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, comment.getUser_id());
			pstat.setString(2, comment.getOrd_id());
			pstat.setString(3,comment.getAdvice());
			pstat.setString(4, comment.getPost_date());
			pstat.setString(5, comment.getReply());
			pstat.setInt(6, comment.getId());
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
	public Comment load(int id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstat = null;
		ResultSet rs = null;
		Comment comment = new Comment();
		String sql = "select * from user_comment where id=?";
		conn = DBConnection.getConnection();
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, id);
			rs = pstat.executeQuery();
			while(rs.next()){
				comment.setId(rs.getInt("id"));
				comment.setOrd_id(rs.getString("ord_id"));
				comment.setUser_id(rs.getInt("user_id"));
				comment.setEval_rank(rs.getString("eval_rank"));
				comment.setAdvice(rs.getString("advice"));
				comment.setPost_date(rs.getString("post_date"));
				comment.setReply(rs.getString("reply"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnection.close(conn);
			DBConnection.close(pstat);
		}
		return comment;
	}

	@Override
	public Comment getLoad(String ord_id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstat = null;
		ResultSet rs = null;
		Comment comment = new Comment();
		String sql = "select * from user_comment where ord_id=?";
		conn = DBConnection.getConnection();
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, ord_id);
			rs = pstat.executeQuery();
			while(rs.next()){
				comment.setId(rs.getInt("id"));
				comment.setOrd_id(rs.getString("ord_id"));
				comment.setUser_id(rs.getInt("user_id"));
				comment.setEval_rank(rs.getString("eval_rank"));
				comment.setAdvice(rs.getString("advice"));
				comment.setPost_date(rs.getString("post_date"));
				comment.setReply(rs.getString("reply"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnection.close(conn);
			DBConnection.close(pstat);
		}
		return comment;
	}
	
}
