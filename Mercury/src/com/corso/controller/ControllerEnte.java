package com.corso.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.corso.model.EnteImpl;

@WebServlet("/ControllerEnte")
public class ControllerEnte extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ControllerEnte() {
        super();

    }
    

    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		RequestDispatcher disp=null;
		EnteImpl ei = new EnteImpl();
		
		String user=request.getParameter("user");
		String psw=request.getParameter("psw");
		
		if(ei.verificaPsw (user , psw)) {		
			disp=request.getRequestDispatcher("/view/enteHome.jsp");
			HttpSession session = request.getSession();
			session.setAttribute("user" , 1);
		} else {
			disp=request.getRequestDispatcher("/view/login.jsp");
			request.setAttribute("messaggio", "User o Password Errati");
		}
		
		disp.forward(request, response);
		
	}
		
		
	
	
		
		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}
