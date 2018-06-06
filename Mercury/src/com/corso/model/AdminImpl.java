package com.corso.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.corso.connection.Dao;

public class AdminImpl implements AdminUtility {

	@Override
	public boolean login(String user, String psw) {
		Connection c = Dao.getConnection();
		PreparedStatement pst;
		ResultSet rs;
		int x = 0;
		try {
			pst = c.prepareStatement(AdminUtility.CHECK_PSW);
			pst.setString(1, user);
			pst.setString(2, psw);
			rs = pst.executeQuery();
			rs.next();
			x = rs.getInt("tot");
		} catch (SQLException e) {

			e.printStackTrace();
		}

		if (x != 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public void sendNotifica(int id_evento, int id_status) {
		NewsletterImpl NI= new NewsletterImpl();
		Connection conn=Dao.getConnection();
		String email=""; 
		try {
			Statement st = conn.createStatement();
			ResultSet rst = st.executeQuery("Select email_ente from enti INNER JOIN eventi ON enti.id_ente=eventi.id_ente where id_evento="+id_evento);

			while (rst.next()) {
			email= rst.getString("email_ente");
			}
		} catch (SQLException a) {
			a.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException o) {
				o.printStackTrace();
			}
		}
		NI.sendMail(id_status, email, id_evento);

		
	}

	@Override
	public ArrayList<Evento> getEventiAttesa() {
		ArrayList<Evento> evList = new ArrayList<Evento>();
		Evento e = null;

		Connection conn = Dao.getConnection();
		try {
			Statement st = conn.createStatement();
			ResultSet rst = st.executeQuery(AdminUtility.GET_EVENTS_PENDING);

			while (rst.next()) {
				e = new Evento();

				e.setId_evento(rst.getInt("id_evento"));
				e.setNome_evento(rst.getString("nome_evento"));
				e.setDescrizione(rst.getString("descrizione"));
				e.setData_inizio(rst.getDate("data_inizio"));
				e.setData_fine(rst.getDate("data_fine"));
				evList.add(e);

			}
		} catch (SQLException a) {
			a.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException o) {
				o.printStackTrace();
			}
		}

		return evList;
	}

	@Override
	public ArrayList<Ente> getEntiAttesa() {
		ArrayList<Ente> enList = new ArrayList<Ente>();
		Ente e = null;

		Connection conn = Dao.getConnection();

		try {
			Statement st = conn.createStatement();
			ResultSet rst = st.executeQuery(AdminUtility.GET_ENTS_PENDING);

			while (rst.next()) {
				e = new Ente();

				e.setId_ente(rst.getInt("id_ente"));
				e.setNome_ente(rst.getString("nome_ente"));
				e.setDescrizione_ente(rst.getString("descrizione_ente"));
				e.setEmail_ente(rst.getString("email_ente"));
				enList.add(e);

			}
		} catch (SQLException a) {
			a.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException o) {
				o.printStackTrace();
			}
		}

		return enList;
	}

	@Override
	public void newCat(String Cat) {
		Connection c = Dao.getConnection();
		if(!Cat.isEmpty()) 
		{
		try {
			PreparedStatement pst = c.prepareStatement(AdminUtility.SET_NEW_CAT);
			pst.setString(1, Cat.replace("'","\'"));
			pst.executeUpdate();
		} catch (SQLException a) {
			a.printStackTrace();
		}
		}
	}

	@Override
	public void modCat(String mcat, int id_categoria) {
		Connection c = Dao.getConnection();
		if(!mcat.isEmpty()) 
		{
		try 
			{
				PreparedStatement pst = c.prepareStatement(AdminUtility.MODIFY_CAT);
				pst.setString(1,mcat.replace("'","\'"));
				pst.setInt(2, id_categoria);
	
				pst.executeUpdate();
			}
		catch (SQLException a) 
			{
				a.printStackTrace();
			}
		}
	}

	@Override

	public void modEvento(int id_ev, int id_status) {

		Connection c = Dao.getConnection();
		try {
			PreparedStatement pst = c.prepareStatement(AdminUtility.SET_EVENT_STATUS);
			
			if (id_status == 2) {
				pst.setInt(1, 2);
			} else {
				if (id_status == 3) {
					pst.setInt(1, 3);
				}
			}
			pst.setInt(2, id_ev);		
			pst.executeUpdate();

		} catch (SQLException u) {
			u.printStackTrace();
		}
	}

	@Override
	public ArrayList<Evento> getAllEvents() {
		ArrayList<Evento> evList = new ArrayList<Evento>();
		Evento e = null;

		Connection conn = Dao.getConnection();
		try {
			Statement st = conn.createStatement();
			ResultSet rst = st.executeQuery(AdminUtility.GET_ALL_EVENTS);

			while (rst.next()) {
				e = new Evento();

				e.setId_evento(rst.getInt("id_evento"));
				e.setId_status(rst.getInt("id_status"));
				e.setNome_status(rst.getString("nome_status"));
				e.setNome_evento(rst.getString("nome_evento"));
				e.setDescrizione(rst.getString("descrizione"));
				e.setData_inizio(rst.getDate("data_inizio"));
				e.setData_fine(rst.getDate("data_fine"));
				
				
				evList.add(e);
			}
		} catch (SQLException a) {
			a.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException o) {
				o.printStackTrace();
			}
		}

		return evList;

	}

	@Override
	public ArrayList<Ente> getAllEnts() {
		ArrayList<Ente> enList = new ArrayList<Ente>();
		Ente e = null;

		Connection conn = Dao.getConnection();

		try {
			Statement st = conn.createStatement();
			ResultSet rst = st.executeQuery(AdminUtility.GET_ALL_ENTS);

			while (rst.next()) {
				e = new Ente();

				e.setId_ente(rst.getInt("id_ente"));
				e.setId_status(rst.getInt("id_status"));
				e.setNome_status(rst.getString("nome_status"));
				e.setNome_ente(rst.getString("nome_ente"));
				e.setDescrizione_ente(rst.getString("descrizione_ente"));
				
				enList.add(e);

			}
		} catch (SQLException a) {
			a.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException o) {
				o.printStackTrace();
			}
		}

		return enList;
	}

	@Override
	public ArrayList<Categoria> getAllCat() {
		ArrayList<Categoria> catList = new ArrayList<Categoria>();
		Categoria e = null;

		Connection conn = Dao.getConnection();

		try {
			Statement st = conn.createStatement();
			ResultSet rst = st.executeQuery(AdminUtility.GET_ALL_CAT);

			while (rst.next()) {
				e = new Categoria();

				e.setId_categoria(rst.getInt("id_categoria"));
				e.setNome_categoria(rst.getString("nome_categoria"));
				catList.add(e);

			}
		} catch (SQLException a) {
			a.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException o) {
				o.printStackTrace();
			}
		}

		return catList;
	}
 
	@Override
	public void modEnte(int id_ente, int id_status) {
		Connection c = Dao.getConnection();
		try {
			PreparedStatement pst = c.prepareStatement(AdminUtility.SET_ENTS_STATUS);
			
			switch(id_status) {
			case 2: pst.setInt(1, 2); break;
			case 3: pst.setInt(1, 3); break;
			case 4: pst.setInt(1, 4); break;
			} 
			
			pst.setInt(2, id_ente);		
			pst.executeUpdate();

		} catch (SQLException u) {
			u.printStackTrace();
		}
	}

	@Override
	public void delCat(int id_categoria) {
		Connection c = Dao.getConnection();
		try {
			PreparedStatement pst = c.prepareStatement(AdminUtility.DELETE_CAT); 
			pst.setInt(1, id_categoria);
			pst.executeUpdate();
			} 
		catch (SQLException a) 
		{
			a.printStackTrace();
		}
		
	}

}
