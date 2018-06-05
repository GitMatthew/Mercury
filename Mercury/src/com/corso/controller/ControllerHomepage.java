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
			String da = "0";
			String cat = "null";
			String reg = "null";
			String pro = "null";
			String com = "null";
			String ini = "";
			String fin = "";
			
			da = request.getParameter("da");
			cat = request.getParameter("categoria");
			reg = request.getParameter("regione");
			pro = request.getParameter("provincia");
			com = request.getParameter("comune");
			ini = request.getParameter("dataInizio");
			fin = request.getParameter("dataFine");
			
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
				
				s1.setAttribute("cate", cat);
				s1.setAttribute("regi", reg);
				s1.setAttribute("prov", pro);
				s1.setAttribute("comu", com);
				s1.setAttribute("iniz", ini);
				s1.setAttribute("fine", fin);
				response.sendRedirect("view/homepageMercury.jsp");
				
				break;
			// cascata tra regioni e province
			case ("2"):
				EventoImpl ev2 = new EventoImpl();
				ArrayList<String> RicEv2 = ev2.filtroProvince(reg);
				
				HttpSession s2 = request.getSession();
				s2.setAttribute("dammiPro", RicEv2);
				s2.setAttribute("cate", cat);
				s2.setAttribute("regi", reg);
				s2.setAttribute("prov", "null");
				s2.setAttribute("comu", "null");
				s2.setAttribute("dammiCom", null);
				s2.setAttribute("iniz", ini);
				s2.setAttribute("fine", fin);
				// request.setAttribute("dammiPro", RicEv2);
				if (RicEv2 != null) {
					for (String j : RicEv2) {
						System.out.print("  ...  " + j + "  \n ");
						
					}
					
					response.sendRedirect("view/homepageMercury.jsp");
				}
				break;
			// cascata tra province e comuni
			case ("3"):
				EventoImpl ev3 = new EventoImpl();
				ArrayList<String> RicEv3 = ev3.filtroComuni(pro);
				HttpSession s3 = request.getSession();
				s3.setAttribute("dammiCom", RicEv3);
				s3.setAttribute("cate", cat);
				s3.setAttribute("regi", reg);
				s3.setAttribute("prov", pro);
				s3.setAttribute("comu", "null");
				s3.setAttribute("iniz", ini);
				s3.setAttribute("fine", fin);
				
				if (RicEv3 != null) {
					for (String j : RicEv3) {
						System.out.print("  ...  " + j + "  \n ");
						
					}
					response.sendRedirect("view/homepageMercury.jsp");
				}
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
