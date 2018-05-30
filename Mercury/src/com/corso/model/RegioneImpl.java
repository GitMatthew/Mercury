package com.corso.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.corso.connection.Dao;

public class RegioneImpl implements RegioneUtility{
	
	
public static ArrayList<Regione> tutteLeRegioni() {
		
		Connection conn=Dao.getConnection();
		Statement st = null ;
		ResultSet rs = null ;
		ArrayList<Regione> reg = new ArrayList<Regione>() ;
		
		
		try {	
			
		    st = conn.createStatement();					
			rs = st.executeQuery(TUTTE_LE_REGIONI);
			
                while(rs.next()) {
				
                	Regione r = new Regione();
				
				r.setId_regione(rs.getInt("id_regione"));
				r.setNome_regione(rs.getString("nome_regione"));
				
				reg.add(r);				
			}
			
		} catch (SQLException e) {
			System.out.println("errore sql");		
			e.printStackTrace();	
		}
		
		return reg;
	}

	

}
