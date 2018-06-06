package com.corso.model;

import java.util.ArrayList;

public interface NewsletterUtility {	
	
	String AGGIUNGI_EMAIL="INSERT INTO `mercury03`.`newsletters` (email, id_cadenza) VALUES";
	String GET_CATEGORIE="SELECT * FROM mercury03.categorie";
	String GET_REGIONE = "SELECT * FROM mercury03.regioni";
	
	String GET_PROVINCE= "select nome_provincia,id_provincia,province.id_regione "
					   + "from mercury03.province,mercury03.regioni "
					   + "where province.id_regione=regioni.id_regione and regioni.id_regione = ";
	
	String GET_COMUNI= "Select nome_comune,id_comune,comuni.id_provincia "
			         + "from mercury03.province,mercury03.comuni "
			         + "where province.id_provincia=comuni.id_provincia and province.id_provincia = ";
	
	String UNSUBSCRIBE="delete  FROM mercury03.newsletters where email = ";	
	
	String GET_ID_CATEGORIA="SELECT id_categoria FROM mercury03.categorie where nome_categoria=";
	
	String GET_CADENZE = "SELECT * FROM mercury03.cadenze";
	
	String INSERT_INTO_NEWSCAT="insert into mercury03.news_cat(id_categoria,id_news)"
			+ " values"; 
    
	String INSERT_INTO_NEWSREG="insert into mercury03.news_reg(id_regione,id_news) values";
	
	String INSERT_INTO_NEWSPRO="insert into mercury03.news_pro(id_provincia,id_news) values";
	
	String INSERT_INTO_NEWSCOM="insert into mercury03.news_com(id_comune,id_news) values";
			
	String UPDATE_DATA="UPDATE `mercury03`.`newsletters` SET `ultimo_invio`='?' WHERE `email`='?'";

			

	
	public ArrayList<Categoria> getCategorie();
	
	public ArrayList<Regione> getRegioni();
	
	public ArrayList<Provincia> getProvince(String regione);
	
	public ArrayList<Comune> getComuni(String provincia);	

	public ArrayList<Cadenza> getCadenze(); 

	public void subscribeNewsletter(String email, String cadenza, ArrayList<Luogo> luoghiTre, String[] categorie);

	public boolean unsubscribeNewsletter(String email);

	public boolean sendMail(String mail, String oggetto, String descrizione);
	
	public void sendMail(int status,int id_ente);
	
	public void sendMail(int status_ev, String email, int id_evento);
}
