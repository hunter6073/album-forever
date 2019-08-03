package com.web.dboper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.web.comm.Comments;
import com.web.db.Util;


public class DBoperation {
	
	public boolean regist(Comments com){		
		Connection conn = Util.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement("insert into comment values(?,?,?,?,?)");
			ps.setString(1, com.getAlbumid());
			ps.setString(2, com.getUserid());
			ps.setString(3, com.getComment());
			ps.setInt(4, com.getRating());
			ps.setDate(5, null);
			ps.executeUpdate();
			return true;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally{
			Util.closeConn(conn);
		}
		
	}
	
	
	public static void main(String[] args){
		Comments com = new Comments();
		com.setAlbumid("003");
		com.setComment("̫可能我就是别人说的beyond死忠粉吧 他们的专辑我都买 不在乎钱");
		com.setRating(4);
		com.setUserid("有钱人");
		DBoperation dao = new DBoperation();
		//dao.regist(com);
		
		if(dao.regist(com)){
			System.out.println("插入成功");
		}else{
			System.out.println("插入失败");
		}
	}
	

}
