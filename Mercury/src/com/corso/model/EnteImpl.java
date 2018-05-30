package com.corso.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
<<<<<<< HEAD

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
	
=======
import java.util.ArrayList;

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

	@Override
	public ArrayList<Ente> getEnti(String qry) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void approvaEnte(int id_ente) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void rifiutaEnte(int id_ente) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void bloccaEnte(int id_ente) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void sbloccaEnte(int id_ente) {
		// TODO Auto-generated method stub
		
>>>>>>> branch 'master' of https://github.com/GitMatthew/Mercury.git
	}
	
	

}
