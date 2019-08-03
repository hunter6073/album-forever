package com.web.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Util {	
	//����jar���ڴ�
	static{
		try {
			Class.forName("com.mysql.jdbc.Driver");	              
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
		//ʹ��jar������ݿ�
	public static Connection getConnection(){		
		Connection conn = null;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://172.29.17.12:3306/diskdistribution?useUnicode=true&characterEncoding=UTF-8","root","");
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return conn;
	}	
		//�ر���ݿ�����	
	public static void closeConn(Connection conn){
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
			//��֤����
	public static void main(String[] args){
		
		System.out.println(getConnection());//��Ϊ��static���������Բ��ô���
		//Connection conn =  getConnection(); ���û��ʹ��static����Ҫ����������ʹ�á�
		//closeConn(conn);
	}

}
