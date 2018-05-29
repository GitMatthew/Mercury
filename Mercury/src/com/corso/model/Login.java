package com.corso.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;

import com.corso.connection.Dao;

public class Login {
	
	String password_ente = "SELECT * FROM enti WHERE user_ente = ?" ;
	
	public boolean verificaPsw (String user , String psw) {	
		
		try {
			
			Connection conn=Dao.getConnection();
			
			PreparedStatement pst = conn.prepareStatement(password_ente);
			
			pst.setString(0, "'" + user + "';");
			
			System.out.println("ok");
					
			
		} catch (SQLException e) {
			
		}
		
		
		
		
		
		
		
		return true ;
	}

}
