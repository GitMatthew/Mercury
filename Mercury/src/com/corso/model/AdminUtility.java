package com.corso.model;

import java.util.*;

public interface AdminUtility 
{
	
	String SET_NEW_PSW="";
	String CHECK_PSW="";
	String CHECK_EVENT_STATUS="";
	String SET_EVENT_STATUS="";
	String SET_NEW_CAT="";
	String MODIFY_CAT="";
	
	
	public boolean login();
	public void cambiaPsw();
	public void sendNotifica();
	public ArrayList<Evento> getEventiAttesa();
	public ArrayList<Ente> getEntiAttesa();
	public String newCat();
	public String modCat();
	
}
