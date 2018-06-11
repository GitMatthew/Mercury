package com.corso.controller;

import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.corso.model.Cadenza;
import com.corso.model.Categoria;
import com.corso.model.Comune;
import com.corso.model.ComuneImpl;
import com.corso.model.EventoImpl;
import com.corso.model.Luogo;
import com.corso.model.NewsletterImpl;
import com.corso.model.Provincia;
import com.corso.model.ProvinciaImpl;
import com.corso.model.Regione;
import com.corso.model.RegioneImpl;
@WebServlet("/ControllerNewsletter")
public class ControllerNewsletter extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	RequestDispatcher disp=null;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hidden = request.getParameter("n");
		NewsletterImpl ip=new NewsletterImpl();			
		HttpSession s=request.getSession();	

		ArrayList<Regione> regioni = ip.getRegioni();	
		ArrayList<Provincia> province = null;
		ArrayList<Comune> comuni = null;
		ArrayList<Categoria> categorie = ip.getCategorie();
		ArrayList<Cadenza> cadenze = ip.getCadenze();

		switch (hidden) {
		case "0":
						   
			ArrayList<Luogo> luoghi = new ArrayList<Luogo>();
			s.setAttribute("luoghi", luoghi);	
			s.setAttribute("categorie", categorie);
			s.setAttribute("cadenze", cadenze);
			request.setAttribute("message", null);
			
			ArrayList<Regione> reg22 = new ArrayList<Regione>();
			EventoImpl ev0 = new EventoImpl();
			RegioneImpl rg = new RegioneImpl();
			reg22 = rg.filtroRegioni();
			HttpSession s0 = request.getSession();
			s0.setAttribute("reg22", reg22);
			
			response.sendRedirect("view/newsletter.jsp");			
			break;
			
		
		case "4":
			s.setAttribute("regioneScelta", null);
			s.setAttribute("province", null);
			s.setAttribute("provinciaScelta", null);
			s.setAttribute("comuni", null);
			s.setAttribute("comuneScelta", null);
			response.sendRedirect("view/newsletter.jsp");
			break;

		case "5":
			if(request.getParameter("id_regione")!= null && request.getParameter("id_regione")!="null"){
				Luogo luogo = new Luogo();
				luogo.setRegione(RegioneImpl.regioneByID(Integer.parseInt(request.getParameter("id_regione"))));
				luogo.setProvincia(ProvinciaImpl.provinciaByID(Integer.parseInt(request.getParameter("id_provincia"))));	
				luogo.setComune(ComuneImpl.comuneByID(Integer.parseInt(request.getParameter("id_comune"))));
				
				luoghi = (ArrayList<Luogo>) s.getAttribute("luoghi");
				luoghi.add(luogo);
				s.setAttribute("luoghi", luoghi);
			}

			//svuoto vecchi attributi
			s.setAttribute("regioneScelta", null);			
			s.setAttribute("provinciaScelta", null);
			s.setAttribute("comuneScelta", null);
			//Aggiungo l'arraylist alla sessione
			response.sendRedirect("view/newsletter.jsp");
			break;

		case "6":
			//svuoto l'arraylist luoghi
			ArrayList<Luogo> luoghiDue = new ArrayList<Luogo>();
			s.setAttribute("luoghi", luoghiDue);
			request.setAttribute("news" , null );
			response.sendRedirect("view/newsletter.jsp");
			break;

		case "7":											// iscrizione alla newsletter
			
			s.setAttribute("messaggio2", "");
			s.setAttribute("messaggio", "");
			String mail = request.getParameter("mail");			
			String cadenza = request.getParameter("cadenza");			
			String[] listacategorie = null;
			if(request.getParameterValues("categorie")==null){
				listacategorie = new String[1]; 
				listacategorie[0] = "1";
			}else {
				listacategorie = request.getParameterValues("categorie");
			}	
			
			ArrayList<Luogo> luoghiTre = (ArrayList<Luogo>) s.getAttribute("luoghi");			
						
			if(mail.equals("")||mail.equals(" ")) {
				s.setAttribute("messaggio", "Attenzione! Email è un campo obbligatorio!");
				
			} else {
				s.setAttribute("messaggio2", "Registrazione Riuscita !  Torna alla HOME.");
				
				System.out.println("sono vivo");
				ip.subscribeNewsletter(mail,cadenza,luoghiTre,listacategorie);
				String oggetto = "Benvenuto in Mercury";
				String descrizione = "Gentile utente, grazie per esserti iscritto a Mercury.\n"
						+ "Da oggi riceverai, in base alla cadenza scelta, tutti gli eventi scelti da te via email.\n"
						+ "\n"
						+ "\n"
						+ "Senza impegno! - unsubscribe mail: http://localhost:8080/MercuryUmberto/view/unsubscribe-newsletter.jsp";
				
				
					ip.sendMail(mail, oggetto, descrizione);	
				
				
			}
			
			response.sendRedirect("view/newsletter.jsp");
			break;

		case "8":											//fase di disiscrizione e controllo al db
			String email=request.getParameter("email");
			String stampa;
			boolean esito=ip.unsubscribeNewsletter(email);

			if(esito==true) {
				stampa="Disiscrizione eseguita correttamente";
				String oggetto2 = "Unsubscribe Mercury";
				String descrizione2 = "Gentile utente, ci dispiace della tua scelta. Speriamo di rivederci presto!!\n";
				ip.sendMail(email, oggetto2, descrizione2);
			}
			else {
				stampa="Nessuna email trovata nel database<br>prova a scriverla correttamente";
			}
			s.setAttribute("stampa", stampa);

			response.sendRedirect("view/unsubscribe-newsletter.jsp");
			break;

			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
