package com.corso.model;

import java.sql.Date;

public class Newsletter {
	
	private int id_news=0;
	private String email="";
	private Date ultimo_invio;
	private int id_cadenza=0;
	private int id_status=0;
	
	
	public int getId_news() {
		return id_news;
	}
	public void setId_news(int id_news) {
		this.id_news = id_news;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getUltimo_invio() {
		return ultimo_invio;
	}
	public void setUltimo_invio(Date ultimo_invio) { 
		this.ultimo_invio = ultimo_invio;
	}
	public int getId_cadenza() {
		return id_cadenza;
	}
	public void setId_cadenza(int id_cadenza) {
		this.id_cadenza = id_cadenza;
	}
	public int getId_status() {
		return id_status;
	}
	public void setId_status(int id_status) {
		this.id_status = id_status;
	}
	

}
