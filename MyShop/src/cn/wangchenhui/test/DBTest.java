package cn.wangchenhui.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.wangchenhui.util.DBConnection;

public class DBTest {
	public static void main(String[] args) {
		Connection conn = DBConnection.getConnection();
		ResultSet rs = null;
		PreparedStatement pstat = null;
		String sql = "select * from d_user where id <= ?";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1,2);
			rs = pstat.executeQuery();
			int result = 0;
			while(rs.next()){
				result = rs.getRow();
			}
			System.out.println("一共有"+result+"条记录");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
