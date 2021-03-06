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
	
	public static int comuneIDByName(String nome) {
		
		Connection conn=Dao.getConnection();
		Statement st = null ;
		ResultSet rs = null ;
		String n = "" ;
		if (nome.replace("'", "\\'")!=null) {
		n = nome.replace("'", "\\'"); 
		}
		String qry = "SELECT * FROM comuni WHERE nome_comune = '"+n+"'";
		int r = 0 ;
		
try {	
			
		    st = conn.createStatement();					
			rs = st.executeQuery(qry);
			
                rs.next();              	
				
				r=rs.getInt("id_comune");		
			
		} catch (SQLException e) {
			System.out.println("errore sql");		
			e.printStackTrace();	
		}
		
		
		return r ;	
		
	}
	
	@Override
	public ArrayList<Comune> filtroComuni(String pro)
	{
		String x = "";
		
		if (!(pro.equals("null"))) {
			x = x + " and p.id_provincia= '" + pro + "'";
			
			x = x + " order by c.nome_comune;";
			
			ArrayList<Comune> atList = new ArrayList<Comune>();
			Comune c = null;
			Connection conn = Dao.getConnection();
			try {
				c = new Comune();
				Statement pst = conn.createStatement();
				ResultSet rst = pst.executeQuery(ComuneUtility.FILTRO_COMUNI + x);
				
				while (rst.next()) {
					c = new Comune();
					c.setNome_comune(rst.getString("nome_comune"));
					c.setId_comune(rst.getInt("id_comune"));
					atList.add(c);
					
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
		return null;
	}
	
public static Comune comuneByID (int id) {
		
		Connection conn = Dao.getConnection();
		Comune c = null;
		String qry = "SELECT * FROM comuni WHERE id_comune = '"+id+"'";
		try {
			
			
			Statement pst = conn.createStatement();
			ResultSet rst = pst.executeQuery(qry);
			
			rst.next();
				c = new Comune();
				c.setNome_comune(rst.getString("nome_comune"));
				c.setId_comune(rst.getInt("id_comune"));
				c.setId_provincia(rst.getInt("id_provincia"));
				
			
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
		return c ;
		
	}

}
