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

import com.corso.model.CascataDiDiamanti;
import com.corso.model.Comune;
import com.corso.model.ComuneImpl;
import com.corso.model.Evento;
import com.corso.model.EventoImpl;
import com.corso.model.Provincia;
import com.corso.model.ProvinciaImpl;
import com.corso.model.Regione;
import com.corso.model.RegioneImpl;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

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
				
				ArrayList<Regione> reg22 = new ArrayList<Regione>();
				
				EventoImpl ev0 = new EventoImpl();
				RegioneImpl rg = new RegioneImpl();
				reg22 = rg.filtroRegioni();
				ArrayList<Evento> RicEv0 = ev0.ricerca("null", "null", "null", "null", "", "");
				HttpSession s0 = request.getSession();
				s0.setAttribute("risultatoRicerca", RicEv0);
				s0.setAttribute("reg22", reg22);
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
		
		String dap = request.getParameter("dap");
		String reg = request.getParameter("regione");
		
		String pro = request.getParameter("provincia");
		CascataDiDiamanti<Provincia> cascP = new CascataDiDiamanti<Provincia>();
		CascataDiDiamanti<Comune> cascC = new CascataDiDiamanti<Comune>();
		Gson gson;
		JsonObject jsObj;
		
		JsonElement listaPRO1;
		JsonElement listaPRO2;
		
		switch (dap)
		{
		case ("0"):
			
			ProvinciaImpl ev2 = new ProvinciaImpl();
			ArrayList<Provincia> ricProv = ev2.filtroProvince(reg);
			ArrayList<String> idp = cascP.dammiID(ricProv, 1);
			
			ArrayList<String> nop = cascP.dammiNOME(ricProv, 1);
			gson = new Gson();
			jsObj = new JsonObject();
			
			listaPRO1 = gson.toJsonTree(idp);
			jsObj.add("pro22", listaPRO1);
			listaPRO2 = gson.toJsonTree(nop);
			jsObj.add("pro23", listaPRO2);
			out.println(jsObj);
			
			break;
		
		case ("1"):
			ComuneImpl ev3 = new ComuneImpl();
			ArrayList<Comune> ricComu = ev3.filtroComuni(pro);
			
			ArrayList<String> idc = cascC.dammiID(ricComu, 2);
			
			ArrayList<String> noc = cascC.dammiNOME(ricComu, 2);
			gson = new Gson();
			jsObj = new JsonObject();
			
			listaPRO1 = gson.toJsonTree(idc);
			jsObj.add("com22", listaPRO1);
			listaPRO2 = gson.toJsonTree(noc);
			jsObj.add("com23", listaPRO2);
			out.println(jsObj);
			break;
		}
		
	}
}
