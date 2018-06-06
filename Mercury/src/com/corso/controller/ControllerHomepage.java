package com.corso.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.corso.model.Evento;
import com.corso.model.EventoImpl;
import com.google.gson.Gson;
import com.google.gson.JsonElement;

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
			if (da == null) {
				da = "0";
			}
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
				EventoImpl ev0 = new EventoImpl();
				ArrayList<Evento> RicEv0 = ev0.ricerca("null", "null", "null", "null", "", "");
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
			
			default:
				// nse sa;
			}
			
		}
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String reg = "null";
		String pro = "null";
		String com = "null";
		
		String dap = request.getParameter("dap");
		reg = request.getParameter("regione");
		pro = request.getParameter("provincia");
		com = request.getParameter("comune");
		
		Gson gson;
		JsonObject jsObj;
		JsonElement listaPRO;
		
		switch (dap)
		{
		case ("0"):
			EventoImpl ev2 = new EventoImpl();
			ArrayList<String> RicEv2 = ev2.filtroProvince(reg);
			gson = new Gson();
			jsObj = new JsonObject();
			listaPRO = gson.toJsonTree(RicEv2);
			jsObj.add("pro22", listaPRO);
			out.println(jsObj);
			break;
		
		case ("1"):
			EventoImpl ev1 = new EventoImpl();
			ArrayList<String> RicEv1 = ev1.filtroComuni(pro);
			gson = new Gson();
			jsObj = new JsonObject();
			listaPRO = gson.toJsonTree(RicEv1);
			jsObj.add("com22", listaPRO);
			out.println(jsObj);
			break;
		}
		
	}
}
