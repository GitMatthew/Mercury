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

import com.corso.model.AdminImpl;
import com.corso.model.Categoria;
import com.corso.model.Ente;
import com.corso.model.Evento;



@WebServlet("/ControllerAdmin")
public class ControllerAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		String prm=request.getParameter("param");
		
		response.setContentType("text/html");
		
		AdminImpl im=new AdminImpl();
		
		if(prm.equals("0"))
		{
			ArrayList<Evento> a=im.getEventiAttesa();
			
			HttpSession session = request.getSession();
			session.setAttribute("attesa", a);
			response.sendRedirect("view/adminHome.jsp");	
			
		}
		if(prm.equals("1"))
		{
			ArrayList<Evento> a=im.getAllEvents();
			HttpSession session = request.getSession();
			session.setAttribute("gestione_eventi", a);
			response.sendRedirect("view/adminGestisciEventi.jsp");
		}	
		if(prm.equals("2"))
		{
			ArrayList<Ente> a=im.getEntiAttesa();
			HttpSession session = request.getSession();
			session.setAttribute("enti_attesa", a);
			response.sendRedirect("view/entiInAttesa.jsp");
		}	
		if(prm.equals("3"))
		{
			ArrayList<Ente> a=im.getAllEnts();
			HttpSession session = request.getSession();
			session.setAttribute("tutti_enti", a);
			response.sendRedirect("view/adminGestisciEnti.jsp");
		}	
		
		if(prm.equals("4"))
		{
			ArrayList<Categoria> a=im.getAllCat();
			HttpSession session = request.getSession();
			session.setAttribute("tutte_le_cat", a);
			response.sendRedirect("view/adminGestisciCategorie.jsp");
		}	
		
		if(prm.equals("mod_stat"))
		{
			HttpSession session = request.getSession();
			int x=Integer.parseInt(request.getParameter("id_evento"));
			int y=Integer.parseInt(request.getParameter("id_status"));
			im.modEvento(x,y);
			ArrayList<Evento> a=im.getEventiAttesa();
			session.setAttribute("attesa", a);
			response.sendRedirect("view/adminHome.jsp");	
			
		}
		
		if(prm.equals("mod_ev"))
		{
			HttpSession session = request.getSession();
			int x=Integer.parseInt(request.getParameter("id_evento"));
			int y=Integer.parseInt(request.getParameter("id_status"));
			im.modEvento(x,y);
			ArrayList<Evento> a=im.getAllEvents();
			session.setAttribute("gestione_eventi", a);
			response.sendRedirect("view/adminGestisciEventi.jsp");	
			
		}
		

		if(prm.equals("mod_stat_ente"))  
		{
			HttpSession session = request.getSession();
			int x=Integer.parseInt(request.getParameter("id_ente"));
			int y=Integer.parseInt(request.getParameter("id_status"));
			im.modEnte(x,y);
			ArrayList<Ente> a=im.getEntiAttesa();
			session.setAttribute("enti_attesa", a);
			response.sendRedirect("view/entiInAttesa.jsp");	
			
		}	 
		
		if(prm.equals("mod_ente"))  
		{
			HttpSession session = request.getSession();
			int x=Integer.parseInt(request.getParameter("id_ente"));
			int y=Integer.parseInt(request.getParameter("id_status"));
			im.modEnte(x,y);
			ArrayList<Ente> a=im.getAllEnts();
			session.setAttribute("tutti_enti", a);
			response.sendRedirect("view/adminGestisciEnti.jsp");	
			
		}	
		
		if(prm.equals("mod_cat"))
		{
			HttpSession session = request.getSession();
			String x=request.getParameter("cat");
			int y= Integer.parseInt(request.getParameter("id_cate"));
			im.modCat(x,y);
			ArrayList<Categoria> a=im.getAllCat();
			session.setAttribute("tutte_le_cat", a);
			response.sendRedirect("view/adminGestisciCategorie.jsp");
		}	
		
		if(prm.equals("new_cat"))
		{
			HttpSession session = request.getSession();
			String ax= request.getParameter("cat");
			im.newCat(ax);
			ArrayList<Categoria> a=im.getAllCat();
			session.setAttribute("tutte_le_cat", a);
			response.sendRedirect("view/adminGestisciCategorie.jsp");
		}	
		if(prm.equals("del_cat"))
		{
			HttpSession session = request.getSession();
			int y= Integer.parseInt(request.getParameter("id_cat"));
			im.delCat(y);
			ArrayList<Categoria> a=im.getAllCat();
			session.setAttribute("tutte_le_cat", a);
			response.sendRedirect("view/adminGestisciCategorie.jsp"); 
		}	
		
		
	}

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	
		AdminImpl log = new AdminImpl();
		
		String user=request.getParameter("user");
		String psw=request.getParameter("psw");
			
		if((log.login (user,psw))==true) 
		{
			
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			ArrayList<Evento> ev = new ArrayList<Evento>();
			ev=log.getEventiAttesa();
			session.setAttribute("attesa", ev);
			response.sendRedirect("view/adminHome.jsp");
		}
		else
		{
			HttpSession session = request.getSession();
			session.setAttribute("rst", "Username o Password Errati");
			response.sendRedirect("view/loginAdmin.jsp"); 
		} 
	}

}
