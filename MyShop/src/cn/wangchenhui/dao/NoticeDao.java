package cn.wangchenhui.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.wangchenhui.model.Notice;
import cn.wangchenhui.model.Pager;
import cn.wangchenhui.model.SystemContext;
import cn.wangchenhui.model.User;
import cn.wangchenhui.util.DBConnection;

/** 
 * @author  Dust 
 * @date 2016-3-15 下午9:56:01 
 * @version 1.0 
 */
public class NoticeDao implements INoticeDao{

	@Override
	public void add(Notice notice) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstat = null;
		String sql = "insert into notice values(null,?,?,?,?)";
		conn = DBConnection.getConnection();
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1,notice.getNotice_title());
			pstat.setString(2,notice.getNotice_content());
			pstat.setString(3,notice.getPost_date());
			pstat.setInt(4,notice.getUser_id());
			pstat.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnection.close(conn);
			DBConnection.close(pstat);
		}
	}
	
	public Notice getNotice(){
		Connection conn = null;
		PreparedStatement pstat = null;
		ResultSet rs = null;
		Notice notice = null;
		String sql = "select * from notice order by id desc limit 0,1";
		conn = DBConnection.getConnection();
		try {
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			while(rs.next()){
				notice = new Notice();
				notice.setId(rs.getInt("id"));
				notice.setNotice_title(rs.getString("notice_title"));
				notice.setNotice_content(rs.getString("notice_content"));
				notice.setPost_date(rs.getString("post_date"));
				notice.setUser_id(rs.getInt("user_id"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBConnection.close(conn);
			DBConnection.close(pstat);
			DBConnection.close(rs);
		}
		return notice;
	}

	@Override
	public Pager<Notice> list() {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement  pstat = null;
		ResultSet rs = null;
		Notice notice = null;
		Pager<Notice> pages = new Pager<Notice>();
		int pageSize = SystemContext.getPageSize();
		int pageOffset = SystemContext.getPageOffset();
		List<Notice> list = new ArrayList<Notice>();
		try {
			conn = DBConnection.getConnection();
			String querySql = "select * from notice";
			querySql += " limit ?,?";
			pstat = conn.prepareStatement(querySql);
			pstat.setInt(1, pageOffset);
			pstat.setInt(2, pageSize);
			rs = pstat.executeQuery();
			while(rs.next()){
				notice = new Notice();
				notice.setId(rs.getInt("id"));
				notice.setNotice_title(rs.getString("notice_title"));
				notice.setNotice_content(rs.getString("notice_content"));
				notice.setPost_date(rs.getString("post_date"));
				notice.setUser_id(rs.getInt("user_id"));
				list.add(notice);
			}
			String countSql = "select count(*) from notice ";
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
	//删除公告
	public void delete(int id){
		Connection conn = null;
		PreparedStatement pstat = null;
		String sql = "delete from notice where id = ?";
		conn = DBConnection.getConnection();
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, id);
			pstat.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBConnection.close(conn);
			DBConnection.close(pstat);
		}
	}
}
