package com.corso.model;

import java.util.*;

public interface AdminUtility 
{

	public static String CHECK_PSW="";
	public static String CHECK_EVENT_STATUS="";
	public static String SET_EVENT_STATUS="";
	public static String SET_NEW_CAT="";
	public static String MODIFY_CAT="";
	
	
	public boolean login();
	public void sendNotifica();
	public ArrayList<Evento> getEventiAttesa();
	public ArrayList<Ente> getEntiAttesa();
	public String newCat();
	public String modCat();
	
}
