package com.corso.model;

import java.util.ArrayList;
import java.util.Date;

public class EventoImpl implements EventoUtility
{
	
	@Override
	public ArrayList<Evento> ricerca(String cat, String reg, String prov, String com, Date inizio, Date fine)
	{
		
		String x = "";
		if (!cat.equals("")) {
			x = x + "and cat.nome_categoria= " + cat;
		}
		
		if (!reg.equals("")) {
			x = x + "and r.nome_regione= " + reg;
		}
		if (!prov.equals("")) {
			x = x + "and r.nome_provincia= " + prov;
		}
		if (!com.equals("")) {
			x = x + "and r.nome_comune= " + com;
		}
		if (inizio != null) {
			x = x + "and r.data_inizio= " + inizio;
		}
		if (fine != null) {
			x = x + "and r.data_fine= " + fine;
		}
		
		x = x + " ;";
		return null;
	}
	
}
