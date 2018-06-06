package com.corso.controller;

import java.io.IOException;

import java.util.ArrayList;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.corso.model.Cadenza;
import com.corso.model.Categoria;
import com.corso.model.Comune;
import com.corso.model.Luogo;
import com.corso.model.NewsletterImpl;
import com.corso.model.Provincia;
import com.corso.model.Regione;
@WebServlet("/ControllerNewsletter")
public class ControllerNewsletter extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
			s.setAttribute("categorie", categorie);
			s.setAttribute("cadenze", cadenze);
			s.setAttribute("regioni", regioni);	   
			ArrayList<Luogo> luoghi = new ArrayList<Luogo>();
			s.setAttribute("luoghi", luoghi);	   
			response.sendRedirect("view/newsletter.jsp");
			break;

		case "1":
			province = ip.getProvince(request.getParameter("regione"));
			Regione reg = null;
			if(reg==null) {
				for(Regione x : regioni) {
					if(x.getId_regione()==Integer.parseInt(request.getParameter("regione"))) {
						reg = x; 
					}
				}
			}
			s.setAttribute("regioneScelta", reg);
			s.setAttribute("province", province);
			response.sendRedirect("view/newsletter.jsp");
			break;

		case "2":
			Provincia prov = null;
			if(prov==null) {
				for(Provincia x :(ArrayList<Provincia>) s.getAttribute("province")) {
					if(x.getId_provincia()==Integer.parseInt(request.getParameter("provincia"))) {
						prov = x; 
					}
				}
			}
			comuni = ip.getComuni(request.getParameter("provincia"));
			s.setAttribute("provinciaScelta", prov);
			s.setAttribute("comuni", comuni);
			response.sendRedirect("view/newsletter.jsp");
			break;

		case "3":
			Comune com = null;
			if(com==null) {
				for(Comune x :(ArrayList<Comune>) s.getAttribute("comuni")) {
					if(x.getId_comune()==Integer.parseInt(request.getParameter("comune"))) {
						com = x; 
					}
				}
			}
			s.setAttribute("comuneScelta", com);
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
			if(s.getAttribute("regioneScelta")!=null){
				Luogo luogo = new Luogo();
				luogo.setRegione((Regione) s.getAttribute("regioneScelta"));
				luogo.setProvincia((Provincia) s.getAttribute("provinciaScelta"));
				luogo.setComune((Comune) s.getAttribute("comuneScelta"));
				luoghi = (ArrayList<Luogo>) s.getAttribute("luoghi");
				luoghi.add(luogo);
				s.setAttribute("luoghi", luoghi);
			}

			//svuoto vecchi attributi
			s.setAttribute("regioneScelta", null);
			s.setAttribute("province", null);
			s.setAttribute("provinciaScelta", null);
			s.setAttribute("comuni", null);
			s.setAttribute("comuneScelta", null);
			//Aggiungo l'arraylist alla sessione
			response.sendRedirect("view/newsletter.jsp");
			break;

		case "6":
			//svuoto l'arraylist luoghi
			ArrayList<Luogo> luoghiDue = new ArrayList<Luogo>();
			s.setAttribute("luoghi", luoghiDue);
			response.sendRedirect("view/newsletter.jsp");
			break;

		case "7":											// iscrizione alla newsletter
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
				response.sendRedirect("view/newsletter2.jsp");
			}else {
				response.sendRedirect("view/newsletter3.jsp");
			}
			
			ip.subscribeNewsletter(mail,cadenza,luoghiTre,listacategorie);
			String oggetto = "Benvenuto in Mercury";
			String descrizione = "Gentile utente, grazie per esserti iscritto a Mercury.\n"
					+ "Da oggi riceverai, in base alla cadenza scelta, tutti gli eventi scelti da te via email.\n"
					+ "\n"
					+ "\n"
					+ "Senza impegno! - unsubscribe mail: http://localhost:8080/MercuryUmberto/view/unsubscribe-newsletter.jsp";
			ip.sendMail(mail, oggetto, descrizione);
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
