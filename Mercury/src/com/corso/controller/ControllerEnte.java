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
import com.corso.model.Ente;
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
		
		
		
		
		
		
		
		
		
		
		
		
		// Registra un nuovo ente 
		 System.out.println(session.getAttribute("from"));
	   if(session.getAttribute("from")=="registraEnte") {
		    			
			String insertQry = "INSERT enti (nome_ente , psw_ente , telefono_ente , id_status , email_ente ,"
			                  +"  user_ente , url_img_ente , descrizione_ente , url_sito_ente) "
			                  +"values ( '"+request.getParameter("nome_ente")+"' , '"+request.getParameter("psw_ente")+"' , "
			                  + "'"+request.getParameter("telefono_ente")+"' , 1 , '"+request.getParameter("email_ente")+"' , "
			          		  + "'"+request.getParameter("user_ente")+"' , '"+request.getParameter("url_img_ente")+"' , "
			          		  + "'"+request.getParameter("descrizione_ente")+"' , '"+request.getParameter("url_sito_ente")+"'  ) ";
		  		   
			System.out.println(insertQry);
			
			Connection conn = Dao.getConnection();	    
		    
			try {
			    Statement pst = conn.createStatement();
			    int rs = pst.executeUpdate(insertQry);
			    disp=request.getRequestDispatcher("/view/loginEnte.jsp");
				request.setAttribute("messaggio", "Ti sei iscritto con successo");
				disp.forward(request, response);
	 
			} catch (SQLException e) {
				disp=request.getRequestDispatcher("/view/registraEnte.jsp"); 
				request.setAttribute("messaggio", "Registrazione fallita , email , user o numero di telefono sono già presenti sul database");
				disp.forward(request, response);
			} 
			
			
			
	   }
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
		
		//Sela sessione non è aperta esegui log in
		if(session.getAttribute("user")==null) {
				
		String user=request.getParameter("user");
		String psw=request.getParameter("psw");
		
		if(ei.verificaPsw (user , psw)) {	
			id_ente = ei.idEnte(user);			
			session.setAttribute("user" , id_ente);
			callHome(id_ente);
			
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
		   
		  Date dataFine =Date.valueOf(request.getParameter("dataFine"));
		  Date dataInizio =Date.valueOf(request.getParameter("dataInizio")); 
		   
		  
		  
		  
		  String qry = "UPDATE eventi SET nome_evento = '"+request.getParameter("nomeEvento").replace("'","§")+"' , descrizione = '"+request.getParameter("descrizione").replace("'","§") +"' , " 
		  		     + "data_inizio = '"+ dataInizio +"' , data_fine = '"+ dataFine +"' , id_status = 1 , id_comune = "+ request.getParameter("id_comune") +" , "
		  		     + "id_categoria = "+ request.getParameter("id_categoria") +" , url_img_evento = '"+request.getParameter("url_img_evento")+"' , " 
		  		     + "url_sito_evento = '"+request.getParameter("url_sito_evento")+"' WHERE id_evento = "+request.getParameter("id_evento") ;
		   
		   Connection conn = Dao.getConnection();	    
			    
			try {
			    Statement pst = conn.createStatement();
			    int rs = pst.executeUpdate(qry);
			    callGestisciEventi(id_ente);
			    request.setAttribute("messaggio", "Evento Modificato con successo e in attesa di approvazione.");
			    
	 
			} catch (SQLException e) {
			    e.printStackTrace();
			    callGestisciEventi(id_ente);
			    request.setAttribute("messaggio", "Modifica fallita !");
			} 
	
				   
			disp.forward(request, response);	   
				  			   
			
	   //Gestisci account				
	   } else if(session.getAttribute("from")=="accountEnte") {
		   
		   String qry = "UPDATE enti SET nome_ente = '"+request.getParameter("nome_ente")+"' , psw_ente = '"+request.getParameter("psw_ente")+"' , "
				      + "telefono_ente = '"+request.getParameter("telefono_ente")+"' , email_ente = '"+request.getParameter("email_ente")+"' , "
				      + "user_ente = '"+request.getParameter("user_ente")+"' , url_img_ente = '"+request.getParameter("url_img_ente")+" ' , "
				      + "descrizione_ente = '"+request.getParameter("descrizione_ente")+"' , url_sito_ente = '"+request.getParameter("url_sito_ente")+"' "
				      + "WHERE id_ente = "+ id_ente ;  		              
		              
		              Connection conn = Dao.getConnection();	    
					    
		  			try {
		  			    Statement pst = conn.createStatement();
		  			    int rs = pst.executeUpdate(qry);
		  			    callHome(id_ente);
		  			    request.setAttribute("messaggio", "Informazioni account aggiornate .");
		  			    
		  	 
		  			} catch (SQLException e) {
		  			    e.printStackTrace();
		  			    callAccountEnte(id_ente);
		  			    request.setAttribute("messaggio", "Modifica fallita !");
		  			} 
		  	
		  				   
		  			disp.forward(request, response);	   
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
		
		session.setAttribute("from" , "enteGestisciEventi");
		request.setAttribute("messaggio", "Benvenuto su Mercury , in questa pagina puoi visualizzare e gestire gli eventi che hai creato !");
		
		ArrayList<Evento> evt = EventoImpl.eventiEnte(id_ente);
		
		request.setAttribute("eventi", evt);
		
	}
    
    //Assega alla request i parametri per la pagina
    public void callAccountEnte (int id) {
		
		disp=request.getRequestDispatcher("/view/accountEnte.jsp");
		
		Ente e = EnteImpl.enteByID(id);
		
		request.setAttribute("ente", e);
		 
		session.setAttribute("from" , "accountEnte");
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
		
		String data_inizio = evt.getData_inizio().toString();
		String data_fine = evt.getData_fine().toString();;
	
		request.setAttribute("categorie", cat);
		request.setAttribute("regioni", reg);
		request.setAttribute("comuni", com);
		request.setAttribute("data_inizio", data_inizio);
		request.setAttribute("data_fine", data_fine);
	
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
