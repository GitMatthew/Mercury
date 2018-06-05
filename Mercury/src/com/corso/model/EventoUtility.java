package com.corso.model;

import java.util.ArrayList;

public interface EventoUtility
{
	public String RICERCA_EVENTI = "SELECT distinct e.url_img_evento,  e.nome_evento as titolo, e.descrizione, cat.nome_categoria , com.nome_comune , e.data_inizio, e.data_fine \r\n"
	        + "from categorie as cat, eventi as e , regioni as r , province as p , comuni as com \r\n"
	        + "where  e.id_status=2  and e.id_categoria=cat.id_categoria and e.id_comune=com.id_comune \r\n"
	        + "and com.id_provincia=p.id_provincia and r.id_regione=p.id_regione  ";
	
	public String EVENTI_ENTE = "SELECT distinct e.url_img_evento,  e.nome_evento , e.descrizione, cat.nome_categoria , com.nome_comune , e.id_status , e.data_inizio, e.data_fine , stat.nome_status , enti.nome_ente , e.id_evento \r\n"
	        + "FROM categorie as cat, eventi as e , regioni as r , province as p , comuni as com , status as stat , enti \r\n"
	        + "WHERE  e.id_status=stat.id_status  and e.id_categoria=cat.id_categoria and e.id_comune=com.id_comune and e.id_ente=enti.id_ente \r\n"
	        + "and com.id_provincia=p.id_provincia and r.id_regione=p.id_regione ";
	
	public String FILTRO_PROVINCE = "select distinct p.nome_provincia \r\n" + "from province as p , regioni as r \r\n"
	        + "where p.id_regione=r.id_regione ";
	
	public String FILTRO_COMUNI = "select distinct c.nome_comune\r\n" + "from comuni as c, province as p \r\n"
	        + "where c.id_provincia=p.id_provincia ";
	
	public ArrayList<Evento> ricerca(String cat, String reg, String prov, String com, String inizio, String fine);
	
	// public ArrayList<Evento> eventiEnte (int id_ente); ATTENZIONE QUESTO METODO é
	// IMPLEMENTATO NELL?IMPL NON CANCELLARLO !!!
	// public ArrayList<Evento> ricercaID (int id_ente); ATTENZIONE QUESTO METODO é
	// IMPLEMENTATO NELL?IMPL NON CANCELLARLO !!!
	
	public ArrayList<String> filtroProvince(String reg);
	
	public ArrayList<String> filtroComuni(String pro);
}
