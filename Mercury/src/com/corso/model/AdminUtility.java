package com.corso.model;

import java.util.*;

public interface AdminUtility 
{

	public static String CHECK_PSW="SELECT Count(amministratori.user) as tot from amministratori where user like ? and psw like ?";
	public static String CHECK_EVENT_STATUS="SELECT * FROM eventi WHERE id_status=1";
	public static String SET_EVENT_STATUS="";
	public static String SET_NEW_CAT="";
	public static String MODIFY_CAT="";
	public static String GET_EVENTS_BY_STATUS="";
	
	public boolean login(String user,String psw);
	public void sendNotifica();
	public ArrayList<Evento> getEventiAttesa();
	public ArrayList<Ente> getEntiAttesa();
	public String newCat();
	public String modCat();
	
}
