package com.corso.model;

import java.util.ArrayList;

public interface ProvinciaUtility
{
	
	public String FILTRO_PROVINCE = "select distinct p.nome_provincia, p.id_provincia \r\n"
	        + "from province as p , regioni as r \r\n" + "where p.id_regione=r.id_regione ";
	
	public ArrayList<Provincia> filtroProvince(String reg);
}
