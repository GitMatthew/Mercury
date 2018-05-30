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
		boolean result = false;
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
	public void sendNotifica() {
		// in attesa dello sviluppo del sistema e-mail
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
	public boolean newCat(String Cat) {
		Connection c = Dao.getConnection();
		boolean result = false;
		try {
			PreparedStatement pst = c.prepareStatement(AdminUtility.SET_NEW_CAT);
			pst.setString(1, Cat);
			int rs = pst.executeUpdate();
			if (rs > 0) {
				result = true;
			}
		} catch (SQLException a) {
			a.printStackTrace();
		}

		return result;
	}

	@Override
	public boolean modCat(String mcat, int id_categoria) {
		Connection c = Dao.getConnection();
		boolean result = false;
		try {
			PreparedStatement pst = c.prepareStatement(AdminUtility.MODIFY_CAT);
			pst.setString(1, mcat);
			pst.setInt(2, id_categoria);

			int rs = pst.executeUpdate();

			if (rs > 0) {
				result = true;
			}

		} catch (SQLException a) {
			a.printStackTrace();
		}

		return result;
	}

	@Override
	public void modEvento(int id_ev, int id_status) {
		Connection c = Dao.getConnection();
		ResultSet rs;
		try {
			PreparedStatement pst = c.prepareStatement(AdminUtility.SET_EVENT_STATUS);
			pst.setInt(2, id_ev);
			if (id_status == 2) {
				pst.setInt(1, 2);
			} else {
				if (id_status == 3) {

					pst.setInt(1, 3);
				}
			}
			rs = pst.executeQuery();

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

}
