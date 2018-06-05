<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% if(session.getAttribute("user")==null)
{
	RequestDispatcher disp=request.getRequestDispatcher("loginEnte.jsp");
	request.setAttribute("messaggio", "Per proseguire serve una sessione attiva. Effettua il Login");
	disp.forward(request, response);
} 
%>    
  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bootstrap 4 Website Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head> 
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark noSpace">
	<a class="navbar-brand noSpace" href="/Mercury_Mercury/ControllerHomepage?da=0"><img
		class="noSpace" style="width: 150px; height: 60px;"
		src="/Mercury_Mercury/images/logo.jpg"> </a>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active spaziaLato"><a class="nav-link"
				href="/Mercury_Mercury/ControllerHomepage?da=0">HOME</a></li>
			
		</ul>
	</div>
</nav>

<center>
<h1>GESTISCI EVENTI</h1>

<%= request.getAttribute("messaggio") %>
<h1 value="messaggio"></h1>

    <form action="/Mercury_Mercury/ControllerEnte" method=get>
    <a href=/Mercury_Mercury/ControllerEnte?pag=1>CREA NUOVO EVENTO</a>   
    <a href=/Mercury_Mercury/ControllerEnte?pag=2>GESTISCI EVENTO</a>   
    <a href=/Mercury_Mercury/ControllerEnte?pag=3>GESTISCI ACCOUNT</a> 
 
 
 
</center>
 
 
 <div style="height:40%; overflow: auto; width:80%"class="container">
  
	    <table border="1" style="width:100%">

	<tr>
		<th>Nome_Evento_</th>
		<th>Descrizione</th>
		<th>Data_Inizio</th>
		<th>Data_Fine__</th>
		<th>Status</th>
		<th>Categoria</th>
		<th>Comune</th>
		<th>MODIFICA</th>
	</tr>
	
	<c:forEach var="j" items="${requestScope.eventi}"> 
		<tr>
			<td><c:out value="${j.nome_evento}"></c:out></td>
			<td><c:out value="${j.descrizione}"></c:out></td>
			<td><c:out value="${j.data_fine}"></c:out></td>
			<td><c:out value="${j.data_fine}"></c:out></td>
			<td><c:out value="${j.nome_status}"></c:out></td>
			<td><c:out value="${j.nome_categoria}"></c:out></td>
			<td><c:out value="${j.nome_comune}"></c:out></td>
					
			<td><a href="/Mercury_Mercury/ControllerEnte?pag=4&id_evento=${j.id_evento}">Modifica</a>/<a href="/Mercury_Mercury/ControllerEnte?pag=5&id_evento=${j.id_evento}">Elimina</a></td>					 
		</tr>
	</c:forEach>
</table>
	
    </form>

</body>
</html>