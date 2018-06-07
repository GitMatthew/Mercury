package com.corso.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.corso.connection.Dao;

public class RegioneImpl implements RegioneUtility
{
	
	public static ArrayList<Regione> tutteLeRegioni()
	{
		
		Connection conn = Dao.getConnection();
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Regione> reg = new ArrayList<Regione>();
		
		try {
			
			st = conn.createStatement();
			rs = st.executeQuery(TUTTE_LE_REGIONI);
			
			while (rs.next()) {
				
				Regione r = new Regione();
				
				r.setId_regione(rs.getInt("id_regione"));
				r.setNome_regione(rs.getString("nome_regione"));
				
				reg.add(r);
			}
			
		}
		catch (SQLException e) {
			System.out.println("errore sql");
			e.printStackTrace();
		}
		
		return reg;
	}
	
	public ArrayList<Regione> filtroRegioni()
	{
		
		ArrayList<Regione> atList = new ArrayList<Regione>();
		Connection conn = Dao.getConnection();
		try {
			
			Regione r = null;
			Statement pst = conn.createStatement();
			ResultSet rst = pst
			        .executeQuery("select nome_regione , id_regione from regioni order by nome_regione ASC; ");
			
			while (rst.next()) {
				r = new Regione();
				r.setNome_regione(rst.getString("nome_regione"));
				r.setId_regione(rst.getInt("id_regione"));
				atList.add(r);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		finally {
			try {
				conn.close();
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		return atList;
		
	}
	
}
