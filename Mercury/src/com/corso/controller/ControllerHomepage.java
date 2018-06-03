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
public class ControllerHomepage extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {

	try {

	    String da = request.getParameter("da");
	    String cat = request.getParameter("categoria");
	    String reg = request.getParameter("regione");
	    String prov = request.getParameter("provincia");
	    String com = request.getParameter("comune");
	    String ini = request.getParameter("dataInizio");
	    String fin = request.getParameter("dataFine");

	    if (da.equals("1")) {
		EventoImpl ev = new EventoImpl();
		ArrayList<Evento> RicEv = ev.ricerca(cat, reg, prov, com, ini, fin);

		HttpSession s = request.getSession();
		s.setAttribute("risultatoRicerca", RicEv);
		response.sendRedirect("view/homepageMercury.jsp");

	    } else if (da.equals("0")) {
		cat = "null";
		reg = "null";
		prov = "null";
		com = "null";
		ini = "";
		fin = "";

		EventoImpl ev = new EventoImpl();
		ArrayList<Evento> RicEv = ev.ricerca(cat, reg, prov, com, ini, fin);

		HttpSession s = request.getSession();
		s.setAttribute("risultatoRicerca", RicEv);
		response.sendRedirect("view/homepageMercury.jsp");
	    }

	} catch (Exception e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}

    }

}
