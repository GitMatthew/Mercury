package com.corso.model;


import java.util.Date;

public class Evento
{
	
	private int id_evento;
	private String nome_evento = null;
	private String descrizione = null;
	private String nome_categoria = null;
	private String nome_comune = null;
	private Date data_inizio;
	private Date data_fine;
	private int id_status;
	private int id_comune;
	private int id_categoria;
	private int id_ente;
	private String url_img_evento;
	private String url_sito_evento;
	private String nome_status;
	
	public Evento()
	{
		super();
	}
	
	public int getId_evento()
	{
		return id_evento;
	}
	
	public void setId_evento(int id_evento)
	{
		this.id_evento = id_evento;
	}
	
	public String getNome_evento()
	{
		return nome_evento;
	}
	
	public void setNome_evento(String nome_evento)
	{
		this.nome_evento = nome_evento;
	}
	
	public String getDescrizione()
	{
		return descrizione;
	}
	
	public void setDescrizione(String descrizione)
	{
		this.descrizione = descrizione;
	}
	
	public Date getData_inizio()
	{
		return data_inizio;
	}
	
	public void setData_inizio(Date data_inizio)
	{
		this.data_inizio = data_inizio;
	}
	
	public Date getData_fine()
	{
		return data_fine;
	}
	
	public void setData_fine(Date data_fine)
	{
		this.data_fine = data_fine;
	}
	
	public int getId_status()
	{
		return id_status;
	}
	
	public void setId_status(int id_status)
	{
		this.id_status = id_status;
	}
	
	public int getId_comune()
	{
		return id_comune;
	}
	
	public void setId_comune(int id_comune)
	{
		this.id_comune = id_comune;
	}
	
	public int getId_categoria()
	{
		return id_categoria;
	}
	
	public void setId_categoria(int id_categoria)
	{
		this.id_categoria = id_categoria;
	}
	
	public int getId_ente()
	{
		return id_ente;
	}
	
	public void setId_ente(int id_ente)
	{
		this.id_ente = id_ente;
	}
	
	public String getUrl_img_evento()
	{
		return url_img_evento;
	}
	
	public void setUrl_img_evento(String url_img_evento)
	{
		this.url_img_evento = url_img_evento;
	}
	
	public String getUrl_sito_evento()
	{
		return url_sito_evento;
	}
	
	public void setUrl_sito_evento(String url_sito_evento)
	{
	}
	
	public String getNome_categoria()
	{
		return nome_categoria;
	}
	
	public void setNome_categoria(String nome_categoria)
	{
		this.nome_categoria = nome_categoria;
	}

	public String getNome_comune()
	{
		return nome_comune;
	}

	public void setNome_comune(String nome_comune)
	{
		this.nome_comune = nome_comune;
	}

	public String getNome_status() {
		return nome_status;
	}

	public void setNome_status(String nome_status) {
		this.nome_status = nome_status;
	}
	
}
