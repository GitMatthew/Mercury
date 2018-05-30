<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% if(session.getAttribute("user")==null)
{
	RequestDispatcher disp=request.getRequestDispatcher("login.jsp");
	request.setAttribute("messaggio", "Per proseguire serve una sessione attiva. Effettua il Login");
	disp.forward(request, response);
} 
%>    
  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>GESTISCI ACCOUNT</h1>

   <button onclick="window.location.href='/Mercury_Mercury/view/enteHome.jsp'">CREA NUOVO EVENTO</button>   
    <button onclick="window.location.href='/Mercury_Mercury/view/gestisciEventi.jsp'">GESTISCI EVENTO</button>   
    <button onclick="window.location.href='/Mercury_Mercury/view/accountEnte.jsp'">GESTISCI ACCOUNT</button> 


</body>
</html>