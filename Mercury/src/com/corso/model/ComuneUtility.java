package com.corso.model;

import java.util.ArrayList;

public interface ComuneUtility {

	   public final String TUTTI_I_COMUNI = "SELECT * FROM comuni LIMIT 100" ;

	public String FILTRO_COMUNI = "select distinct c.nome_comune, c.id_comune , p.nome_provincia from comuni as c, province as p where c.id_provincia=p.id_provincia ";
	
	public ArrayList<Comune> filtroComuni(String pro);
}
