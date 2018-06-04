package com.corso.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.corso.connection.Dao;
import com.corso.model.Categoria;
import com.corso.model.CategoriaImpl;
import com.corso.model.Comune;
import com.corso.model.ComuneImpl;
import com.corso.model.EnteImpl;
import com.corso.model.Evento;
import com.corso.model.EventoImpl;
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
			session.setAttribute("user" , id_ente);
			
		} else {
			disp=request.getRequestDispatcher("/view/loginEnte.jsp");
			request.setAttribute("messaggio", "User o Password Errati");
		}
		
		disp.forward(request, response);
		
		
		
		//Se la sessione è aperta passa al crea evento
		} else if(session.getAttribute("from")=="enteHome") {
			
			if(request.getParameter("indirizzo")==null||request.getParameter("indirizzo")==""||
			   request.getParameter("nomeEvento")==null||request.getParameter("nomeEvento")==""||
			   request.getParameter("dataInizio")==null) {
				
				//disp=request.getRequestDispatcher("/view/enteHome.jsp");
				request.setAttribute("messaggio", "CREAZIONE EVENTO FALLITA ! Complila tutti i campi obbligatori !!!");
				disp.forward(request, response);
		    }
			
			Evento nuovoEvento = new Evento();
						
			Date dataFine =Date.valueOf(request.getParameter("dataFine"));
			Date dataInizio =Date.valueOf(request.getParameter("dataInizio"));	
			
			if(dataFine==null) {
				dataFine=dataInizio;
			}
					
			String descrizione="Location : "+request.getParameter("indirizzo") + " ~ " + request.getParameter("descrizione");										
			nuovoEvento.setUrl_img_evento(request.getParameter("urlImg"));
			nuovoEvento.setNome_evento(request.getParameter("nomeEvento"));
			nuovoEvento.setId_categoria(Integer.parseInt(request.getParameter("id_categoria")));
			nuovoEvento.setDescrizione(descrizione);
			nuovoEvento.setId_comune(Integer.parseInt(request.getParameter("id_comune")));
			nuovoEvento.setData_inizio(dataInizio);  
			nuovoEvento.setData_fine(dataFine);
			nuovoEvento.setUrl_sito_evento(request.getParameter("urlEvento"));
			nuovoEvento.setId_ente(this.id_ente);
			nuovoEvento.setId_status(1);
			
			if(ei.creaEvento(nuovoEvento)) {
				disp=request.getRequestDispatcher("/view/enteGestisciEventi.jsp");
				callGestisciEventi(id_ente);
				request.setAttribute("messaggio", "COMPLIMENTI ! Il tuo Evento è stato creato ed è in attesa dell'approvazione di un Amministratore.");
			} else {
				disp=request.getRequestDispatcher("/view/enteHome.jsp");
				request.setAttribute("messaggio", "CREAZIONE EVENTO FALLITA ! Errore DataBase , riprova più tardi .");
			}
			
			disp.forward(request, response);
			
			
	   //Gestisci Eventi
	   } else if(session.getAttribute("from")=="enteGestisciEventi") {
		   
		   
		   
		   
						
			
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
		ArrayList<Comune> com = ComuneImpl.tuttiIComuni();
		
		request.setAttribute("categorie", cat);
		request.setAttribute("regioni", reg);
		request.setAttribute("comuni", com);
		session.setAttribute("from" , "enteHome");
		
		request.setAttribute("messaggio", "Benvenuto su Mercury , in questa pagina puoi creare i tuoi Eventi !");
		
	}
	
	//Assega alla request i parametri per la pagina
    public void callGestisciEventi (int id) {
		
		disp=request.getRequestDispatcher("/view/enteGestisciEventi.jsp");
		
		session.setAttribute("pagina" , "enteGestisciEventi");
		request.setAttribute("messaggio", "Benvenuto su Mercury , in questa pagina puoi visualizzare e gestire gli eventi che hai creato !");
		
		ArrayList<Evento> evt = EventoImpl.eventiEnte(id_ente);
		
		request.setAttribute("eventi", evt);
		
	}
    
    //Assega alla request i parametri per la pagina
    public void callAccountEnte (int id) {
		
		disp=request.getRequestDispatcher("/view/accountEnte.jsp");
		 
		session.setAttribute("pagina" , "accountEnte");
		request.setAttribute("messaggio", "Da questa pagina puoi gestire il tuo Account");
	}
    
  //Assega alla request i parametri per la pagina
    public void callModificaEvento (String id) {
		
		disp = request.getRequestDispatcher("/view/modificaEvento.jsp");
		
		Evento evt = EventoImpl.ricercaID(id);
		ArrayList<Categoria> cat = CategoriaImpl.tutteLeCategorie();
		ArrayList<Regione> reg = RegioneImpl.tutteLeRegioni();
		ArrayList<Comune> com = ComuneImpl.tuttiIComuni();
		
		request.setAttribute("evento", evt);
				
		request.setAttribute("categorie", cat);
		request.setAttribute("regioni", reg);
		request.setAttribute("comuni", com);
		
		session.setAttribute("pagina" , "modificaEvento");
		request.setAttribute("messaggio", "Puoi modificare il tuo evento tutti i cambiamenti esclusa la data dovranno essere approvati da un amministratore");
	}
	
	
		
		
		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pag = request.getParameter("pag");
		String id_evento = request.getParameter("id_evento");	
		
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
			
        case "4":
        	callModificaEvento(id_evento);
			break;
			
        case "5":
        	eliminaEvento(id_evento);
        	      	
			break;

		default:
			callHome(id_ente);
			break;
		} 
		
		disp.forward(request, response);
		
	}



	private void eliminaEvento(String id) {
		Connection conn = Dao.getConnection();
		String qry = "DELETE FROM eventi WHERE id_evento = "+id;		    
		    
		try {
		    Statement pst = conn.createStatement();
		    int rs = pst.executeUpdate(qry);
		    callGestisciEventi(id_ente);
		    request.setAttribute("messaggio", "Evento Eliminato con successo !");
 
		} catch (SQLException e) {
		    e.printStackTrace();
		    callGestisciEventi(id_ente);
		    request.setAttribute("messaggio", "Eliminazione fallita !");
		}
	}

}
