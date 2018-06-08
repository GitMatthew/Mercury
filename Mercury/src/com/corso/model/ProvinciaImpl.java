package com.corso.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.corso.connection.Dao;

public class ProvinciaImpl implements ProvinciaUtility
{
	
	@Override
	public ArrayList<Provincia> filtroProvince(String reg)
	{
		
		String x = "";
		if (!(reg.equals("null"))) {
			x = x + " and r.id_regione= '" + reg + "'";
			
			x = x + " order by p.nome_provincia;";
			
			ArrayList<Provincia> atList = new ArrayList<Provincia>();
			
			Connection conn = Dao.getConnection();
			try {
				
				Provincia p = new Provincia();
				Statement pst = conn.createStatement();
				ResultSet rst = pst.executeQuery(ProvinciaUtility.FILTRO_PROVINCE + x);
				
				while (rst.next()) {
					p = new Provincia();
					p.setNome_provincia(rst.getString("nome_provincia"));
					p.setId_provincia(rst.getInt("id_provincia"));
					atList.add(p);
				}
				
				return atList;
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
	
}
