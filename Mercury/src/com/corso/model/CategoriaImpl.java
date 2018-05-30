package com.corso.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.corso.connection.Dao;

public class CategoriaImpl implements CategoriaUtility {

	
	public static ArrayList<Categoria> tutteLeCategorie() {
		
		Connection conn=Dao.getConnection();
		Statement st = null ;
		ResultSet rs = null ;
		ArrayList<Categoria> cat = new ArrayList<Categoria>() ;
		
		
		try {	
			
		    st = conn.createStatement();					
			rs = st.executeQuery(TUTTE_LE_CATEGORIE);
			
                while(rs.next()) {
				
				Categoria c = new Categoria();
				
				c.setId_categoria(rs.getInt("id_categoria"));
				c.setNome_categoria(rs.getString("nome_categoria"));
				
				cat.add(c);				
			}
			
		} catch (SQLException e) {
			System.out.println("errore sql");		
			e.printStackTrace();	
		}
		
		return cat;
	}

}
