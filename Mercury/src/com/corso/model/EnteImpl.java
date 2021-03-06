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
	public int verificaPsw (String user , String psw) {	
		
		String qry = "SELECT * FROM enti WHERE user_ente='"+user+"'";
		Connection conn=Dao.getConnection();
		Statement st = null ;
		ResultSet rs = null ;
		String pswOk = null;
		int status = 0 ;
		
		try {	
			
		    st = conn.createStatement();					
			rs = st.executeQuery(qry);			
			rs.next();			
			pswOk = rs.getString("psw_ente");
			status = rs.getInt("id_status");
			
		} catch (SQLException e) {
			System.out.println("errore sql");		
			e.printStackTrace();
			return 5 ;		
		}	
		
		if(psw.equals(pswOk) && status == 2) {
			return 2 ;
		} else if (status == 1){
			return 1 ;
		} else if (status == 3){
			return 3 ;
		} else if (status == 4){
			return 4 ;
		} else {
			return 5 ;
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
	
    public static Ente enteByID (int id) {
		
		String qry = "SELECT * FROM enti WHERE id_ente='"+id+"'";
		Connection conn=Dao.getConnection();
		Statement st = null ;
		ResultSet rs = null ;
		Ente e = new Ente();
		
		try {			
		    st = conn.createStatement();					
			rs = st.executeQuery(qry);			
			rs.next();	
			
			e.setId_ente(id);
			e.setNome_ente(rs.getString("nome_ente"));
			e.setPsw_ente(rs.getString("psw_ente"));
			e.setTelefono_ente(rs.getString("telefono_ente"));
			e.setId_status(rs.getInt("id_status"));
			e.setEmail_ente(rs.getString("email_ente"));
			e.setUser_ente(rs.getString("user_ente"));
			e.setUrl_img_ente(rs.getString("url_img_ente"));
			e.setDescrizione_ente(rs.getString("descrizione_ente"));
			e.setUrl_sito_ente(rs.getString("url_sito_ente"));
			
			
		} catch (SQLException ex) {
			System.out.println("errore sql");		
			ex.printStackTrace();	
		}	
		
		return e ;
	
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
