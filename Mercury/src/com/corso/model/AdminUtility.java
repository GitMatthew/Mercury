package com.corso.model;

import java.util.*;

public interface AdminUtility {

	public static String CHECK_PSW = "SELECT Count(user) as tot from amministratori where user like ? and psw like ?";
	public static String CHECK_EVENT_STATUS = "SELECT * FROM eventi WHERE id_status=1";
	public static String CHECK_ENTS_STATUS = "SELECT * FROM enti WHERE id_status=1";
	public static String SET_EVENT_STATUS = "UPDATE eventi SET id_status=? WHERE id_evento=?";
	public static String SET_ENTS_STATUS = "UPDATE enti SET id_status=? WHERE id_ente=?"; 
	public static String SET_NEW_CAT = "INSERT categorie(nome_categoria) values (?)";
	public static String MODIFY_CAT = "UPDATE categorie SET nome_categoria=? WHERE id_categoria=?";
	public static String GET_EVENTS_PENDING = "SELECT id_evento,nome_evento,descrizione,data_inizio,data_fine FROM eventi WHERE data_inizio >= now() and id_status=1 order by eventi.data_inizio";
	public static String GET_ENTS_PENDING = "SELECT id_ente,nome_ente,descrizione_ente,email_ente FROM enti WHERE id_status=1";
	public static String GET_ALL_EVENTS="SELECT id_evento,eventi.id_status,status.nome_status,nome_evento,descrizione,data_inizio,data_fine FROM eventi inner join status on eventi.id_status=status.id_status WHERE data_inizio >= now() and status.id_status=2 || status.id_status=3 order by eventi.data_inizio";
	public static String GET_ALL_ENTS="SELECT id_ente,enti.id_status,status.nome_status,nome_ente,descrizione_ente FROM enti inner join status on enti.id_status=status.id_status  WHERE status.id_status=2 || status.id_status=3 || status.id_status=4 order by enti.id_status";
	public static String GET_ALL_CAT = "SELECT id_categoria,nome_categoria FROM categorie";
	

	public boolean login(String user, String psw);

	public void sendNotifica();

	public ArrayList<Evento> getEventiAttesa();

	public ArrayList<Ente> getEntiAttesa();

	public void newCat(String Cat);

	public void modCat(String mcat, int id_categoria );

	public void modEvento(int id_ev,int id_status);
	
	public void modEnte(int id_ent,int id_status);
	
	public ArrayList<Evento> getAllEvents();
	
	public ArrayList<Ente> getAllEnts();
	
	public ArrayList<Categoria> getAllCat();

}
