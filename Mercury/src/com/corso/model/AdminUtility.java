package com.corso.model;

import java.util.*;

public interface AdminUtility {

	public static String CHECK_PSW = "SELECT Count(amministratori.user) as tot from amministratori where user like ? and psw like ?";
	public static String CHECK_EVENT_STATUS = "SELECT * FROM eventi WHERE id_status=1";
	public static String SET_EVENT_STATUS = "UPDATE eventi SET id_status=? WHERE id_evento=?";
	public static String SET_NEW_CAT = "INSERT categorie(nome_categoria) values (?)";
	public static String MODIFY_CAT = "";
	public static String GET_EVENTS_PENDING = "SELECT nome_evento,descrizione,data_inizio,data_fine FROM eventi WHERE id_status=1";

	public boolean login(String user, String psw);

	public void sendNotifica();

	public ArrayList<Evento> getEventiAttesa();

	public ArrayList<Ente> getEntiAttesa();

	public boolean newCat(String Cat);

	public String modCat();

	public void modEvento(int id_ev, int id_status);

}
