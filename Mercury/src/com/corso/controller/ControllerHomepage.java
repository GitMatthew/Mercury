package com.corso.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
			String pro = request.getParameter("provincia");
			String com = request.getParameter("comune");
			String ini = request.getParameter("dataInizio");
			String fin = request.getParameter("dataFine");
			
			switch (da)
			{
			// Tutto ciò che torna alla Homepage
			case ("0"):
				cat = "null";
				reg = "null";
				pro = "null";
				com = "null";
				ini = "";
				fin = "";
				EventoImpl ev0 = new EventoImpl();
				ArrayList<Evento> RicEv0 = ev0.ricerca(cat, reg, pro, com, ini, fin);
				HttpSession s0 = request.getSession();
				s0.setAttribute("risultatoRicerca", RicEv0);
				response.sendRedirect("view/homepageMercury.jsp");
				break;
			// filtro di ricerca
			case ("1"):
				EventoImpl ev1 = new EventoImpl();
				ArrayList<Evento> RicEv1 = ev1.ricerca(cat, reg, pro, com, ini, fin);
				
				HttpSession s1 = request.getSession();
				s1.setAttribute("risultatoRicerca", RicEv1);
				response.sendRedirect("view/homepageMercury.jsp");
				break;
			// cascata tra regioni e province
			case ("2"):
				EventoImpl ev2 = new EventoImpl();
				ArrayList<Evento> RicEv2 = ev2.filtroProvince(reg);
				
				HttpSession s2 = request.getSession();
				s2.setAttribute("cascataRegProv", RicEv2);
				response.sendRedirect("view/homepageMercury.jsp");
				break;
			// cascata tra province e comuni
			case ("3"):
				EventoImpl ev3 = new EventoImpl();
				ArrayList<Evento> RicEv3 = ev3.filtroComuni(pro);
				HttpSession s3 = request.getSession();
				s3.setAttribute("cascataProvCom", RicEv3);
				response.sendRedirect("view/homepageMercury.jsp");
				break;
			default:
				// nse sa;
			}
			
		}
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
