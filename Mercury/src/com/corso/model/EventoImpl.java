package com.corso.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.corso.connection.Dao;

public class EventoImpl implements EventoUtility
{
	
	@Override
	public ArrayList<Evento> ricerca(String cat, String reg, String pro, String com, String ini, String fin)
	{
		
		String x = "";
		if (!cat.equals("null")) {
			x = x + " and cat.nome_categoria= '" + cat + "'";
		}
		
		if (!reg.equals("null")) {
			x = x + " and r.nome_regione= '" + reg + "'";
		}
		if (!pro.equals("null")) {
			x = x + " and p.nome_provincia=  '" + pro + "'";
		}
		if (!com.equals("null")) {
			x = x + " and com.nome_comune=   '" + com + "'";
		}
		if (ini != "null") {
			x = x + " and e.data_inizio= '" + ini + "'";
		}
		if (fin != "null") {
			x = x + " and e.data_fine= '" + fin + "'";
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
				// a.setUrl_img_evento(rst.getString("private String url_img_evento;"));
				a.setNome_evento(rst.getString("titolo"));
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
	
	@Override
	public ArrayList<Evento> primiEventi()
	{
		
		ArrayList<Evento> atList = new ArrayList<Evento>();
		Evento a = null;
		Connection conn = Dao.getConnection();
		try {
			Statement pst = conn.createStatement();
			ResultSet rst = pst.executeQuery(EventoUtility.TUTTI_EVENTI);
			
			while (rst.next()) {
				a = new Evento();
				a.setUrl_img_evento(rst.getString("private String url_img_evento;"));
				a.setNome_evento(rst.getString("titolo"));
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