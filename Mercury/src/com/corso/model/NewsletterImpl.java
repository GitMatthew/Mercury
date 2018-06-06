package com.corso.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.corso.connection.Dao;

public class NewsletterImpl implements NewsletterUtility {	


	@Override
	public ArrayList<Categoria> getCategorie() {


		ArrayList<Categoria> categorie =  new ArrayList<Categoria>();
		Connection con=Dao.getConnection();
		try {
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(NewsletterUtility.GET_CATEGORIE);
			while(rs.next()) {
				Categoria cat = new Categoria();
				cat.setId_categoria(rs.getInt("id_categoria"));
				cat.setNome_categoria(rs.getString("nome_categoria"));
				categorie.add(cat);
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}	
		finally {
			try {
				con.close();
			}
			catch (SQLException e){
				e.printStackTrace();
			}
		}

		return categorie;
	}


	@Override
	public ArrayList<Regione> getRegioni() {

		ArrayList<Regione> regioni =  new ArrayList<Regione>();
		Connection con=Dao.getConnection();
		try {
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(NewsletterUtility.GET_REGIONE);
			while(rs.next()) {
				Regione regione = new Regione();
				regione.setId_regione(rs.getInt("id_regione"));
				regione.setNome_regione(rs.getString("nome_regione"));			
				regioni.add(regione);
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}	
		finally {
			try {
				con.close();
			}
			catch (SQLException e){
				e.printStackTrace();
			}
		}

		return regioni;
	}


	@Override
	public ArrayList<Provincia> getProvince(String regione) {

		ArrayList<Provincia> province =  new ArrayList<Provincia>();
		Connection con=Dao.getConnection();
		try {
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(NewsletterUtility.GET_PROVINCE+regione);
			while(rs.next()) {
				Provincia provincia = new Provincia();
				provincia.setId_provincia(rs.getInt("id_provincia"));
				provincia.setNome_provincia(rs.getString("nome_provincia"));
				provincia.setId_regione(rs.getInt("id_regione"));
				province.add(provincia);
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}	
		finally {
			try {
				con.close();
			}
			catch (SQLException e){
				e.printStackTrace();
			}
		}

		return province;

	}


	@Override
	public ArrayList<Comune> getComuni(String provincia) {

		ArrayList<Comune> comuni =  new ArrayList<Comune>();
		Connection con=Dao.getConnection();
		try {
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(NewsletterUtility.GET_COMUNI+provincia);
			while(rs.next()) {
				Comune comune = new Comune();
				comune.setId_comune(rs.getInt("id_comune"));	
				comune.setNome_comune(rs.getString("nome_comune"));	
				comune.setId_provincia(rs.getInt("id_provincia"));	
				comuni.add(comune);
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}	
		finally {
			try {
				con.close();
			}
			catch (SQLException e){
				e.printStackTrace();
			}
		}

		return comuni;

	}


	@Override
	public ArrayList<Cadenza> getCadenze() {
		ArrayList<Cadenza> cadenze =  new ArrayList<Cadenza>();
		Connection con=Dao.getConnection();
		try {
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(NewsletterUtility.GET_CADENZE);
			while(rs.next()) {
				Cadenza cad = new Cadenza();
				cad.setId_cadenza(rs.getInt("id_cadenza"));
				cad.setNome_cadenza(rs.getString("nome_cadenza"));
				cadenze.add(cad);
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}	
		finally {
			try {
				con.close();
			}
			catch (SQLException e){
				e.printStackTrace();
			}
		}

		return cadenze;
	}


	@Override

	public void subscribeNewsletter(String email,String cadenza,ArrayList<Luogo> luoghiTre,String [] categorie) {

		Connection con=Dao.getConnection();
		try {

			Statement st=con.createStatement();			
			st.executeUpdate(NewsletterUtility.AGGIUNGI_EMAIL+"('"+email+"','"+cadenza+"')");

			for(int i=0;i<categorie.length;i++) {
				st.executeUpdate(NewsletterUtility.INSERT_INTO_NEWSCAT+"('"+categorie[i]+"'"+",(select id_news from newsletters ORDER BY id_news DESC LIMIT 1 ))");
			}

			for(int i=0; i<luoghiTre.size();i++) {

				int regione=luoghiTre.get(i).getRegione().getId_regione();
				st.executeUpdate(NewsletterUtility.INSERT_INTO_NEWSREG+"('"+regione+"'"+",(select id_news from newsletters ORDER BY id_news DESC LIMIT 1 ))");

				if(luoghiTre.get(i).getProvincia()!=null) {

					int provincia=luoghiTre.get(i).getProvincia().getId_provincia();
					st.executeUpdate(NewsletterUtility.INSERT_INTO_NEWSPRO+"('"+provincia+"'"+",(select id_news from newsletters ORDER BY id_news DESC LIMIT 1 ))");
				}

				if(luoghiTre.get(i).getComune()!=null) {

					int comune=luoghiTre.get(i).getComune().getId_comune();
					st.executeUpdate(NewsletterUtility.INSERT_INTO_NEWSCOM+"('"+comune+"'"+",(select id_news from newsletters ORDER BY id_news DESC LIMIT 1 ))");
				}
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}	
		finally {
			try {
				con.close();
			}
			catch (SQLException e){
				e.printStackTrace();
			}

		}



	}


	@Override
	public boolean unsubscribeNewsletter(String email) {

		Connection con=Dao.getConnection();
		boolean esito=false;

		try {

			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("SELECT * FROM mercury03.newsletters");
			while(rs.next()) {

				if(rs.getString("email").equals(email)) {
					st.executeUpdate(NewsletterUtility.UNSUBSCRIBE +"'"+email+"'");
					esito=true;
					break;
				}

			}}
		catch(SQLException e){
			e.printStackTrace();
		}	
		finally {
			try {
				con.close();
			}
			catch (SQLException e){
				e.printStackTrace();
			}
		}
		return esito;
	}


	@Override
	public boolean sendMail(String mail, String oggetto, String descrizione) {
		boolean risultato = false;

		final String user="mercurysincronox@gmail.com";
		final String password="rootroot";
	
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.setProperty("mail.transport.protocol", "smtp");     
		props.setProperty("mail.host", "smtp.gmail.com");  
		props.put("mail.smtp.auth", "true");  
		props.put("mail.smtp.port", "465");  
		props.put("mail.smtp.socketFactory.port", "465");  
		props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");  
		props.put("mail.smtp.socketFactory.fallback", "false");  

		Session session = Session.getDefaultInstance(props,
				new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user,password);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO,new InternetAddress(mail));
			message.setSubject(oggetto);
			message.setText(descrizione);
			Transport.send(message);
			
			risultato = true;

		} catch (MessagingException e) {e.printStackTrace();}
		
		return risultato;
	}

	public void sendMail(int status,int id_ente){
		
		final String user="mercurysincronox@gmail.com";
		final String password="rootroot";
		String mail="";
		String oggetto="Richiesta iscrizione nuovo Ente";
	    String testo = "";
	    String nome="";
	    try {
	    Connection con=Dao.getConnection();
	    Statement st=con.createStatement();
	    ResultSet rs=st.executeQuery("Select email_ente,nome_ente from enti where id_ente="+id_ente);
	    rs.next();
	    nome=rs.getString("nome_ente");
	    mail=rs.getString("email_ente");
	    
	    if(status==2) { testo = "Gentile "+nome+", la tua richiesta di iscrizione è stata: Approvata, Benvenuto in Mercury!";}
	    if(status==3) { testo = "Gentile "+nome+", la tua richiesta di iscrizione è stata: Rifiutata, contattare l'amministratore.";}
	    if(status==4) { testo = "Gentile "+nome+", A causa di mancata osservanza del codice di utilizzo della nostra piattaforma, \n Sei stato bloccato.";oggetto="Sospensione iscrizione ente";}
	    
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.setProperty("mail.transport.protocol", "smtp");     
		props.setProperty("mail.host", "smtp.gmail.com");  
		props.put("mail.smtp.auth", "true");  
		props.put("mail.smtp.port", "465");  
		props.put("mail.smtp.socketFactory.port", "465");  
		props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");  
		props.put("mail.smtp.socketFactory.fallback", "false");  

		Session session = Session.getDefaultInstance(props,
				new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user,password);
			}
		});
		
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO,new InternetAddress(mail));
			message.setSubject(oggetto);
			message.setText(testo);
			Transport.send(message);

		} catch (MessagingException e) {e.printStackTrace();}
	    	catch (SQLException e) {e.printStackTrace();
		}
	
		
	}






















}


