package com.corso.model;

import java.util.ArrayList;

public interface EventoUtility {
    public String RICERCA_EVENTI = "SELECT distinct e.url_img_evento,  e.nome_evento as titolo, e.descrizione, cat.nome_categoria , com.nome_comune , e.data_inizio, e.data_fine \r\n"
	    + "from categorie as cat, eventi as e , regioni as r , province as p , comuni as com \r\n"
	    + "where  e.id_status=2  and e.id_categoria=cat.id_categoria and e.id_comune=com.id_comune \r\n"
	    + "and com.id_provincia=p.id_provincia and r.id_regione=p.id_regione  ";

    public ArrayList<Evento> ricerca(String cat, String reg, String prov, String com, String inizio, String fine);

    // public ArrayList<Evento> eventiEnte (int id_ente);
}
