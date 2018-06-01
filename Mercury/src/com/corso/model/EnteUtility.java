package com.corso.model;

import java.util.ArrayList;

public interface EnteUtility {
	
	public final String eveti_in_attesa = "SELECT * FROM enti WHERE id_status = '1' ; ";
	public final String eveti_approvati = "SELECT * FROM enti WHERE id_status = '2' ; ";
	public final String eventi_bloccati = "SELECT * FROM enti WHERE id_status = '4' ; ";
	public final String tutti_gli_enti = "SELECT * FROM enti ; ";
	
	public ArrayList<Ente> getEnti(String qry) ;
	
	public void approvaEnte (int id_ente) ;
	
	//public ArrayList<Ente> getEnti(String qry) ;
	
	public boolean verificaPsw (String user , String psw);
	
	//public void approvaEnte (int id_ente) ;
	//public void rifiutaEnte (int id_ente) ;
	//public void bloccaEnte (int id_ente) ;
	//public void sbloccaEnte (int id_ente) ;

	public void rifiutaEnte (int id_ente) ;
	public void bloccaEnte (int id_ente) ;
	public void sbloccaEnte (int id_ente) ;
	
	public boolean creaEvento (Evento e) ;

}
