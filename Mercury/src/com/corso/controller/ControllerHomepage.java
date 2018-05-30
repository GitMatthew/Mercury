package com.corso.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.corso.model.Evento;
import com.corso.model.EventoImpl;

/**
 * Servlet implementation class ControllerHomepage
 */
@WebServlet("/ControllerHomepage")
public class ControllerHomepage extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		try {
			
			String da = request.getParameter("da");
			String cat = request.getParameter("categoria");
			String reg = request.getParameter("regione");
			String prov = request.getParameter("provincia");
			String com = request.getParameter("comune");
			String ini = request.getParameter("da");
			String fin = request.getParameter("da");
			
			if (da.equals("1")) {
				EventoImpl ev = new EventoImpl();
				ArrayList<Evento> RicEv = ev.ricerca(cat, reg, prov, com, ini, fin);
				RequestDispatcher disp = request.getRequestDispatcher("view/testArr.jsp");
				request.setAttribute("risultatoRicerca", RicEv);
				disp.forward(request, response);
				
			}
			else if (da.equals("0")) {
				
				EventoImpl ev = new EventoImpl();
				ArrayList<Evento> RicEv = ev.primiEventi();
				
				RequestDispatcher disp = request.getRequestDispatcher("view/testArr.jsp");
				request.setAttribute("risultatoRicerca", RicEv);
				disp.forward(request, response);
			}
			
		}
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
