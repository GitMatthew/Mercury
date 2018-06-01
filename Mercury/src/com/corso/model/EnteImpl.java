package com.corso.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;

import com.corso.connection.Dao;

public class EnteImpl implements EnteUtility {
	

	//ciao
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
	
	public int idEnte (String user) {
		
		String qry = "SELECT * FROM enti WHERE user_ente='"+user+"'";
		Connection conn=Dao.getConnection();
		Statement st = null ;
		ResultSet rs = null ;
		int id = 0;
		
		try {	
			
		    st = conn.createStatement();					
			rs = st.executeQuery(qry);			
			rs.next();			
			id = rs.getInt("id_ente");
			
		} catch (SQLException e) {
			System.out.println("errore sql");		
			e.printStackTrace();	
		}	
		
		return id ;
	
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
		
	}
	
	
	
	
	
	

	@Override
	public boolean creaEvento(Evento e) {
		Connection c = Dao.getConnection();
		boolean result = false;
		try {
			String insertQry = "INSERT eventi (nome_evento , descrizione , data_inizio , data_fine , id_status ,"
					          +"  id_comune , id_categoria , id_ente , url_img_evento , url_sito_evento) "
					          +"values ( ? , ? , ? , ? , ? , ? , ? , ? , ? , ? ) ";
			
			PreparedStatement pst = c.prepareStatement(insertQry);
			pst.setString(1, e.getNome_evento());     //nome_evento
			pst.setString(2, e.getDescrizione());     //descrizione
			pst.setString(3, ""+e.getData_inizio());  //data_inizio
			pst.setString(4, ""+e.getData_fine());    //data_fine
			pst.setString(5, ""+e.getId_status());    //id_status
			pst.setString(6, ""+e.getId_comune());    //id_comune
			pst.setString(7, ""+e.getId_categoria()); //id_categoria
			pst.setString(8, ""+e.getId_ente());      //id_ente
			pst.setString(9, e.getUrl_img_evento());  //url_img_evento
			pst.setString(10, e.getUrl_sito_evento());//url_sito_evento
			
			int rs = pst.executeUpdate();
			if (rs > 0) {
				result = true;
			}
		} catch (SQLException a) {
			a.printStackTrace();
		}

		return result;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
