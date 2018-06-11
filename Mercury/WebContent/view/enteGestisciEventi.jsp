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
<title>Mercury Events</title>
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
<link rel="stylesheet" type="text/css" href="/Mercury_Mercury/css/homepageStile.css">

</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark noSpace"
		style="background-color:black !important;">
	<a class="navbar-brand noSpace" href="/Mercury_Mercury/ControllerHomepage?da=0"><img
		class="noSpace" style="width: 150px; height: 60px;"
		src="/Mercury_Mercury/images/logo.jpg"> </a>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active spaziaLato"><a class="nav-link"
				href="/Mercury_Mercury/ControllerHomepage?da=0">HOME</a></li>
			
		</ul>
	</div>
	<div >
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active spaziaLato"><a class="nav-link"
				href="/Mercury_Mercury/ControllerEnte?pag=6">LOG OUT</a></li>
			
		</ul>
	</div>
</nav>

<center>
<div class="banner01">
<br><br>
<h1 class="scrittabianca">GESTISCI EVENTI</h1>
<% if(request.getAttribute("messaggio")!=null) { %>   	
<h3 class="scrittabianca"><%=request.getAttribute("messaggio")%></h3>	
<% } else {	%>	
<h3 class="scrittabianca">Benvenuto su Mercury !</h3> 
<% } %>

<br><br></div>

     <div align="center" class="row sticky-top banner01"
		style="overflow: auto; padding: 10px; margin: 0px; min-width: 100%; max-width: 100%; background-color: rgba(128, 0, 0, 0.4);">

		<div class="col">
			<a href="/Mercury_Mercury/ControllerEnte?pag=1"  class="linkAPRIricerca banner01">
				NUOVO EVENTO </a>
				</div>
        
		<div class="col">
			<a href="/Mercury_Mercury/ControllerEnte?pag=2"  class="linkAPRIricerca banner01">
				GESTISCI EVENTO </a>
				</div>

		<div class="col">
			<a href="/Mercury_Mercury/ControllerEnte?pag=3"  class="linkAPRIricerca banner01">
				GESTISCI ACCOUNT </a>
				</div>	
						  
	</div>
	<br>
 
 
</center>
 
	<div  id="vediStretto" class="col-sm-12">
			<table class="table table-dark table-hover" style="table-layout:fixed;">
<thead>
	<tr>
		<th>Nome_Evento </th>
		<th colspan="2">Descrizione</th>
		<th>Data_inizio_fine</th>
		<th>Status</th>
		<th>Categoria</th>
		<th>Comune</th>
		<th>MODIFICA</th>
	</tr>
	</thead>
	
	<tbody>
	<c:forEach var="j" items="${requestScope.eventi}"> 
		<tr>
			<td><c:out value="${j.nome_evento}"></c:out></td>
			<td style="word-wrap:break-word" colspan="2"><c:out value="${j.descrizione}"></c:out></td>
			<td><c:out value="${j.data_inizio} - ${j.data_fine}"></c:out></td>
			<td><c:out value="${j.nome_status}"></c:out></td>
			<td><c:out value="${j.nome_categoria}"></c:out></td>
			<td><c:out value="${j.nome_comune}"></c:out></td>
					
			<td><a class="nosottolina" href="/Mercury_Mercury/ControllerEnte?pag=4&id_evento=${j.id_evento}">Modifica</a>/<a class="nosottolina rossorosso" href="/Mercury_Mercury/ControllerEnte?pag=5&id_evento=${j.id_evento}">Elimina</a></td>					 
		</tr>
	</c:forEach> 
		</tbody>
</table>


</body>
</html>