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
       
  
    public ControllerEnte() {
        super();

    }
    

    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		this.request = request ;
		
		ei = new EnteImpl();
		
		String user=request.getParameter("user");
		String psw=request.getParameter("psw");
		
		if(ei.verificaPsw (user , psw)) {	
			id_ente = ei.idEnte(user);
			callHome(id_ente);
			HttpSession session = request.getSession();
			session.setAttribute("user" , 1);
			
		} else {
			disp=request.getRequestDispatcher("/view/login.jsp");
			request.setAttribute("messaggio", "User o Password Errati");
		}
		
		disp.forward(request, response);
		
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
		
	}
	
	//Assega alla request i parametri per la pagina
    public void callGestisciEventi (int id) {
		
		disp=request.getRequestDispatcher("/view/gestisciEventi.jsp");
		
		
	}
    
    //Assega alla request i parametri per la pagina
    public void callAccountEnte (int id) {
		
		disp=request.getRequestDispatcher("/view/accountEnte.jsp");
		
		
	}
	
	
	
		
	
	
	
		
		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pag = request.getParameter("pag");
		System.out.println(pag);
		
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
