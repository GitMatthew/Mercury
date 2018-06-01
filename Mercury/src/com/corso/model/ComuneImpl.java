package com.corso.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.corso.connection.Dao;

public class ComuneImpl implements ComuneUtility {

	public static ArrayList<Comune> tuttiIComuni() {
		Connection conn=Dao.getConnection();
		Statement st = null ;
		ResultSet rs = null ;
		ArrayList<Comune> com = new ArrayList<Comune>() ;
		
		
		try {	
			
		    st = conn.createStatement();					
			rs = st.executeQuery(TUTTI_I_COMUNI);
			
                while(rs.next()) {
				
                	Comune r = new Comune();
				
				r.setId_comune(rs.getInt("id_comune"));
				r.setNome_comune(rs.getString("nome_comune"));
				
				com.add(r);				
			}
			
		} catch (SQLException e) {
			System.out.println("errore sql");		
			e.printStackTrace();	
		}
		
		return com;
	}

}
