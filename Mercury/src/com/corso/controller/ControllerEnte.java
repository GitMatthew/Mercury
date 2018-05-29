package com.corso.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
			
		System.out.println(user + " " + psw); //Test
		
		if(ei.verificaPsw (user , psw)) {
			
			System.out.println("ok 2 "); //Test
			
		}
		
		
		
		
		if (psw.equals("1234")) {
			disp=request.getRequestDispatcher("/view/enteHome.jsp");
		} else {
			disp=request.getRequestDispatcher("/view/login.jsp");
		}
		
			disp.forward(request, response);
			
	
		
		
		
		
		
		
		
		
		
		
		
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}
}
}
