package com.corso.model;

public class Provincia {
	
	private String nome_provincia = null ;
	private int id_provincia = 0 ;
	private int id_regione = 0 ;
	
	public Provincia () {}
	
	public String getNome_provincia() {
		return nome_provincia;
	}
	public void setNome_provincia(String nome_provincia) {
		this.nome_provincia = nome_provincia;
	}
	public int getId_provincia() {
		return id_provincia;
	}
	public void setId_provincia(int id_provincia) {
		this.id_provincia = id_provincia;
	}
	public int getId_regione() {
		return id_regione;
	}
	public void setId_regione(int id_regione) {
		this.id_regione = id_regione;
	}
	
	

}
