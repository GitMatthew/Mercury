package com.corso.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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
		
		String da = request.getParameter("da");
		
		if (da.equals("1")) {
			String cat = request.getParameter("categoria");
			String reg = request.getParameter("regione");
			String prov = request.getParameter("provincia");
			String com = request.getParameter("comune");
			SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy/MM/dd");
			String dataInizioInString = request.getParameter("dataInizio");
			SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy/MM/dd");
			String dataFineInString = request.getParameter("dataFine");
			
			try {
				Date dataInizio = formatter1.parse(dataInizioInString);
				Date dataFine = formatter2.parse(dataFineInString);
				
				EventoImpl ev = new EventoImpl();
				ArrayList<Evento> RicEv = ev.ricerca(cat, reg, prov, com, dataInizio, dataFine);
				
				RequestDispatcher disp = request.getRequestDispatcher("view/homepageMercury.jsp");
				request.setAttribute("risultatoRicerca", RicEv);
				disp.forward(request, response);
			}
			catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
	}
	
}
