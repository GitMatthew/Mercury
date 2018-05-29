package com.corso.model;

import java.util.*;

public interface AdminUtility {
	
	public boolean login();
	public void cambiaPsw();
	public void sendNotifica();
	public ArrayList<Evento> getEventiAttesa();
	public ArrayList<Ente> getEntiAttesa();
}
