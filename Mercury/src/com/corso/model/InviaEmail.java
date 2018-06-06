package com.corso.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.URLName;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.corso.connection.Dao;

public class InviaEmail 
{
	Connection con = null;
	private final String host = "smtp.gmail.it";
    private final String mittente = "mercurysincronox@gmail.com";
	String oggetto = "";
	private final String user="mercurysincronox@gmail.com";
	private final String psw ="rootroot";

	
	public void sendEmail(int cadenza) throws SQLException {
		
		if(con==null) con=Dao.getConnection();
        Statement st = con.createStatement();
        
        Properties p = System.getProperties();
	
		p.setProperty("mail.smtp.host", this.host);
	    p.put("mail.smtp.host", this.host);
	    p.put("mail.debug", "true");
	    p.put("mail.smtp.auth", "true"); 
	     
	    Session sessione = Session.getDefaultInstance(p, new SmtpAutenticazione(user, psw) );
	    sessione.setPasswordAuthentication(new URLName("smtp", host, 465, "INBOX", user, psw), new PasswordAuthentication(user, psw));
	     
	    MimeMessage mail = new MimeMessage(sessione);
	    

        String query="SELECT * FROM mercury03.cadenza where id_cadenza = " + cadenza;	

        
        ResultSet rs = st.executeQuery(query);
		
		if(cadenza==1) { oggetto = "Invio newsLetter giornaliera Mercury"; }
		if(cadenza==2) { oggetto = "Invio newsLetter settimanale Mercury"; }
		if(cadenza==3) { oggetto = "Invio newsLetter mensile Mercury"; }
	
	    String testo = "Questi sono i possimi eventi scelti: \n\n";
	     
	    try {
	    	 while(rs.next()) {
	    		String dest =("email");
	    		
	    		 
	    		String nuovaQuery = "select nome_evento, data_inizio, data_fine, descrizione from eventi ";
	    		 
	            ResultSet rs2 = st.executeQuery(nuovaQuery);
	            String testoEventi = "";
	            while(rs2.next()) {
	            	String nomeEvento = rs2.getString("nome_evento");
	            	String dataInizio = rs2.getString("data_inizio");
	            	String dataFine   = rs2.getString("data_fine");
	            	String desc       = rs2.getString("descrizione");
	            	
	            	testoEventi += ("- "+nomeEvento+" inzierà il: "+dataInizio+" e terminerà il: "+dataFine+" descrizione evento:"+desc+"\n");
	            }
	            testoEventi += "\nGrazie per aver scelto il servizio di newsletter di Mercury";
	            System.out.println(testoEventi);
	            
	    	 	mail.setFrom(new InternetAddress(mittente));
	    	 	mail.addRecipients(Message.RecipientType.TO, dest);
	    	 	
	    	 	mail.setSubject(oggetto);
	    	 	mail.setText(testo+testoEventi);
	    	 	 
	    	 	Transport tr = sessione.getTransport("smtp");
				tr.connect(host, user, psw);
	    	 	Transport.send(mail, mail.getAllRecipients());
	    	 	System.out.println(mail);
	    	 }	
	     }catch(Exception e) {
	    	 	e.printStackTrace();
	     }
	}
	
public void sendEmail(int status, String email) throws SQLException {
		
		if(con==null) con=Dao.getConnection();
        Properties p = System.getProperties();
      
        
		p.setProperty("mail.smtp.host", this.host);
	    p.put("mail.smtp.host", this.host);
	    p.put("mail.debug", "true");
	    p.put("mail.smtp.auth", "true"); 
	     
	    Session sessione = Session.getDefaultInstance(p, new SmtpAutenticazione(user, psw) );
	    sessione.setPasswordAuthentication(new URLName("smtp", host, 465, "INBOX", user, psw), new PasswordAuthentication(user, psw));
	     
	    MimeMessage mail = new MimeMessage(sessione);
	    

       
		 oggetto = "Richiesta iscrizione nuovo Ente"; 
		
		
	
	    String testo = "";
	   
	    if(status==2) { testo= "La tua richiesta di iscrizione è stata: Approvata";}
	    if(status==3) { testo= "La tua richiesta di iscrizione è stata: Rifiutata";}
	    try {
	    	
	    		String dest =(email);
	    		mail.setFrom(new InternetAddress(mittente));
	    	 	mail.addRecipients(Message.RecipientType.TO, dest);
	    	 	
	    	 	mail.setSubject(oggetto);
	    	 	mail.setText(testo);
	    	 	
	    	 	Transport tr = sessione.getTransport("smtp");
				tr.connect(host, user, psw);
	    	 	Transport.send(mail, mail.getAllRecipients());
	    	 	System.out.println(mail);
	    	 }	
	    catch(Exception e) {
	    	 	e.printStackTrace();
	     }
	}
}
