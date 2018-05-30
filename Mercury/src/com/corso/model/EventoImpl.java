package com.corso.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import com.corso.connection.Dao;

public class EventoImpl implements EventoUtility
{
	
	@Override
	public ArrayList<Evento> ricerca(String cat, String reg, String prov, String com, Date inizio, Date fine)
	{
		
		String x = "";
		if (!cat.equals(null)) {
			x = x + "and cat.nome_categoria= " + cat;
		}
		
		if (!reg.equals(null)) {
			x = x + "and r.nome_regione= " + reg;
		}
		if (!prov.equals(null)) {
			x = x + "and r.nome_provincia= " + prov;
		}
		if (!com.equals(null)) {
			x = x + "and r.nome_comune= " + com;
		}
		if (inizio != null) {
			x = x + "and r.data_inizio= " + inizio;
		}
		if (fine != null) {
			x = x + "and r.data_fine= " + fine;
		}
		
		x = x + " ;";
		
		ArrayList<Evento> atList = new ArrayList<Evento>();
		Evento a = null;
		Connection conn = Dao.getConnection();
		try {
			Statement pst = conn.createStatement();
			ResultSet rst = pst.executeQuery(EventoUtility.RICERCA_EVENTI + x);
			
			while (rst.next()) {
				a = new Evento();
				a.setNome_evento(rst.getString("nome_evento"));
				a.setNome_categoria(rst.getString("nome_categoria"));
				a.setDescrizione(rst.getString("descrizione"));
				a.setNome_comune(rst.getString("nome_comune"));
				a.setData_inizio(rst.getDate("data_inizio"));
				a.setData_fine(rst.getDate("data_fine"));
				atList.add(a);
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
