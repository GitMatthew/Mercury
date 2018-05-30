package com.corso.model;

public class Categoria {
	
	private int id_categoria = 0 ;
	private String nome_categoria = null ;
	
	
	public Categoria () {}
	
	
	
	public int getId_categoria() {
		return id_categoria;
	}
	public void setId_categoria(int id_categoria) {
		this.id_categoria = id_categoria;
	}
	public String getNome_categoria() {
		return nome_categoria;
	}
	public void setNome_categoria(String nome_categoria) {
		this.nome_categoria = nome_categoria;
	}

}
