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

import com.corso.model.Categoria;
import com.corso.model.CategoriaImpl;
import com.corso.model.EnteImpl;
import com.corso.model.Regione;
import com.corso.model.RegioneImpl;

@WebServlet("/ControllerEnte")
public class ControllerEnte extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static int id_ente = 0 ;
	RequestDispatcher disp=null;
	HttpServletRequest request = null ;
	EnteImpl ei = null ;
	static HttpSession session = null ;
       
  
    public ControllerEnte() {
        super();

    }
    

    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		this.request = request ;
		
		ei = new EnteImpl();
		
		this.session = request.getSession();
		
		//Sela sessione non è aperta esegui log in
		if(session.getAttribute("user")==null) {
				
		String user=request.getParameter("user");
		String psw=request.getParameter("psw");
		
		if(ei.verificaPsw (user , psw)) {	
			id_ente = ei.idEnte(user);
			callHome(id_ente);
			session.setAttribute("user" , 1);
			
		} else {
			disp=request.getRequestDispatcher("/view/loginEnte.jsp");
			request.setAttribute("messaggio", "User o Password Errati");
		}
		
		disp.forward(request, response);
		
		
		//Se la sessione è aperta passa al crea evento
		} else if(session.getAttribute("from")=="enteHome") {
			
			String nomeEvento=request.getParameter("nomeEvento");
			String indirizzo=request.getParameter("indirizzo");
			String descrizione=request.getParameter("descrizione");
			String id_categoria=request.getParameter("id_categoria");
			String id_comune=request.getParameter("id_regione");
			String dataInizio=request.getParameter("annoInizio") + "-" + request.getParameter("meseInizio") + "-" + request.getParameter("giornoInizio");
			String dataFine=request.getParameter("annoFine") + "-" + request.getParameter("meseFine") + "-" + request.getParameter("giornoFine");
			System.out.println(nomeEvento);
			System.out.println(indirizzo);
			System.out.println(descrizione);
			System.out.println(id_categoria);
			System.out.println(id_comune);
			System.out.println(dataInizio);
			System.out.println(dataFine);		
			
			
	   //Gestisci Eventi
	   } else if(session.getAttribute("from")=="gestisciEventi") {
						
			
	   //Gestisci account				
	   } else if(session.getAttribute("from")=="accountEnte") {
		   
		   
	   }
	
	}
	
	//restituisce id ente in sessione
	public int getIdEnteLoggato () {	
		return id_ente ;
	
	
	}
		 

	
	//Assega alla request i parametri per la pagina
	public void callHome (int id) {
		
		disp=request.getRequestDispatcher("/view/enteHome.jsp");
		
		ArrayList<Categoria> cat = CategoriaImpl.tutteLeCategorie();
		ArrayList<Regione> reg = RegioneImpl.tutteLeRegioni();
		
		request.setAttribute("categorie", cat);
		request.setAttribute("regioni", reg);
		session.setAttribute("from" , "enteHome");
		
	}
	
	//Assega alla request i parametri per la pagina
    public void callGestisciEventi (int id) {
		
		disp=request.getRequestDispatcher("/view/EnteGestisciEventi.jsp");
		
		session.setAttribute("pagina" , "gestisciEventi");
	}
    
    //Assega alla request i parametri per la pagina
    public void callAccountEnte (int id) {
		
		disp=request.getRequestDispatcher("/view/accountEnte.jsp");
		
		session.setAttribute("pagina" , "accountEnte");
	}
	
	
	
		
	
	
	
		
		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pag = request.getParameter("pag");
		
		switch (pag) {
		case "1":
			callHome(id_ente);
			break;
			
        case "2":
        	callGestisciEventi(id_ente);
			break;
			
        case "3":
        	callAccountEnte(id_ente);
			break;

		default:
			callHome(id_ente);
			break;
		} 
		
		disp.forward(request, response);
		
	}

}
