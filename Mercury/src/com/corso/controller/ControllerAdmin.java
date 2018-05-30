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
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String prm=request.getParameter("param");
		
		response.setContentType("text/html");
		
		AdminImpl im=new AdminImpl();
		
		if(prm.equals("0"))
		{
		//ciao filli	
			ArrayList<Evento> a=im.getEventiAttesa();
			
			RequestDispatcher disp=request.getRequestDispatcher("view/adminHome.jsp");
			
			request.setAttribute("attesa", a);
			
			disp.forward(request, response);	
			
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
			RequestDispatcher disp=request.getRequestDispatcher("view/loginAdmin.jsp");
			request.setAttribute("rst", "Username o Password Errati");
			disp.forward(request, response);	
			
		} 
	}

}
