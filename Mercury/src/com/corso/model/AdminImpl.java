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
		boolean result = false;
		try {
			PreparedStatement pst = c.prepareStatement(AdminUtility.CHECK_PSW);

			pst.setString(1, user);
			pst.setString(2, psw);

			ResultSet rs = pst.executeQuery();

			if (rs.getInt("tot") > 0) {
				result = true;
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void sendNotifica() {

	}

	// da completare
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
		return null;
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

		try {
			PreparedStatement pst = c.prepareStatement(AdminUtility.SET_EVENT_STATUS);
			pst.setInt(1, id_ev);
			if (id_status == 2) {
				pst.setInt(2, 2);
			} else {
				pst.setInt(2, 3);
			}
			ResultSet rs = pst.executeQuery();

		} catch (SQLException u) {
			u.printStackTrace();
		}
	}

}
