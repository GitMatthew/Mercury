package com.corso.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.corso.connection.Dao;

public class EventoImpl implements EventoUtility {

    @Override
    public ArrayList<Evento> ricerca(String cat, String reg, String pro, String com, String ini, String fin) {

	String x = "";
	if (!(cat.equals("null"))) {
	    x = x + " and cat.nome_categoria= '" + cat + "'";
	} else {
	}
	if (!(reg.equals("null"))) {
	    x = x + " and r.nome_regione= '" + reg + "'";
	} else {
	}
	if (!(pro.equals("null"))) {
	    x = x + " and p.nome_provincia= '" + pro + "'";
	} else {
	}
	if (!(com.equals("null"))) {
	    x = x + " and com.nome_comune= '" + com + "'";
	} else {
	}
	if (!(ini.equals(""))) {
	    x = x + " and e.data_inizio= '" + ini + "'";
	} else {
	}
	if (!(fin.equals(""))) {
	    x = x + " and e.data_fine= '" + fin + "'";
	} else {
	}

	x = x + " order by data_inizio asc;";

	ArrayList<Evento> atList = new ArrayList<Evento>();
	Evento a = null;
	Connection conn = Dao.getConnection();
	try {
	    Statement pst = conn.createStatement();
	    ResultSet rst = pst.executeQuery(EventoUtility.RICERCA_EVENTI + x);

	    while (rst.next()) {
		a = new Evento();
		a.setUrl_img_evento(rst.getString("url_img_evento"));
		a.setNome_evento(rst.getString("titolo"));
		a.setNome_categoria(rst.getString("nome_categoria"));
		a.setDescrizione(rst.getString("descrizione"));
		a.setNome_comune(rst.getString("nome_comune"));
		a.setData_inizio(rst.getDate("data_inizio"));
		a.setData_fine(rst.getDate("data_fine"));
		atList.add(a);
	    }
	} catch (SQLException e) {
	    e.printStackTrace();
	}

	finally {
	    try {
		conn.close();
	    } catch (SQLException e) {
		e.printStackTrace();
	    }
	}
	return atList;

    }

	public static ArrayList<Evento> eventiEnte(int id_ente) {
		ArrayList<Evento> atList = new ArrayList<Evento>();
		Evento a = null;
		Connection conn = Dao.getConnection();
		String qry = "SELECT * FROM eventi WHERE id_ente = " + id_ente ;
		try {
		    Statement pst = conn.createStatement();
		    ResultSet rst = pst.executeQuery(qry);

		    while (rst.next()) {
			a = new Evento();
			a.setUrl_img_evento(rst.getString("url_img_evento"));
			a.setNome_evento(rst.getString("titolo"));
			a.setNome_categoria(rst.getString("nome_categoria"));
			a.setDescrizione(rst.getString("descrizione"));
			a.setNome_comune(rst.getString("nome_comune"));
			a.setData_inizio(rst.getDate("data_inizio"));
			a.setData_fine(rst.getDate("data_fine"));
			atList.add(a);
		    }
		    
		    System.out.println(atList);
		} catch (SQLException e) {
		    e.printStackTrace();
		}

		finally {
		    try {
			conn.close();
		    } catch (SQLException e) {
			e.printStackTrace();
		    }
		}
		return atList; 

	    }
	
	@Override
    public ArrayList<Evento> filtroProvince(String reg)
    {

	String x = "";

	if (!(reg.equals("null")))
	{
	    x = x + " and r.nome_regione= '" + reg + "'";
	} else
	{
	}

	x = x + " order by p.nome_provincia;";

	ArrayList<Evento> atList = new ArrayList<Evento>();
	Evento a = null;
	Connection conn = Dao.getConnection();
	try
	{
	    Statement pst = conn.createStatement();
	    ResultSet rst = pst.executeQuery(EventoUtility.FILTRO_PROVINCE + x);

	    while (rst.next())
	    {
		a = new Evento();
		a.setNome_provincia(rst.getString("nome_provincia"));
		atList.add(a);
	    }
	} catch (SQLException e)
	{
	    e.printStackTrace();
	}

	finally
	{
	    try
	    {
		conn.close();
	    } catch (SQLException e)
	    {
		e.printStackTrace();
	    }
	}
	return atList;
    }

    @Override
    public ArrayList<Evento> filtroComuni(String pro)
    {
	String x = "";

	if (!(pro.equals("null")))
	{
	    x = x + " and p.nome_provincia= '" + pro + "'";
	} else
	{
	}
	x = x + " order by c.nome_comune;";

	ArrayList<Evento> atList = new ArrayList<Evento>();
	Evento a = null;
	Connection conn = Dao.getConnection();
	try
	{
	    Statement pst = conn.createStatement();
	    ResultSet rst = pst.executeQuery(EventoUtility.FILTRO_COMUNI + x);

	    while (rst.next())
	    {
		a = new Evento();
		a.setNome_comune(rst.getString("nome_comune"));
		atList.add(a);
	    }
	} catch (SQLException e)
	{
	    e.printStackTrace();
	}

	finally
	{
	    try
	    {
		conn.close();
	    } catch (SQLException e)
	    {
		e.printStackTrace();
	    }
	}
	return atList;
    }
    
    

}