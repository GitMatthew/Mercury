package com.corso.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;

import com.corso.connection.Dao;

public class EnteImpl implements EnteUtility {
	

	
	public boolean verificaPsw (String user , String psw) {	
		
		String qry = "SELECT * FROM enti WHERE user_ente='"+user+"'";
		Connection conn=Dao.getConnection();
		Statement st = null ;
		ResultSet rs = null ;
		String pswOk = null;
		
		try {	
			
		    st = conn.createStatement();					
			rs = st.executeQuery(qry);			
			rs.next();			
			pswOk = rs.getString("psw_ente");
			
		} catch (SQLException e) {
			System.out.println("errore sql");		
			e.printStackTrace();
			return false ;		
		}	
		
		if(psw.equals(pswOk)) {
			return true ;
		} else {
			return false ;
		}
	
	}
	
	

}
