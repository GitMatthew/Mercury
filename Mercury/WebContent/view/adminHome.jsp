<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% if(session.getAttribute("user")==null)
{
	RequestDispatcher disp=request.getRequestDispatcher("loginAdmin.jsp");
	request.setAttribute("rst", "Per proseguire serve una sessione attiva. Effettua il Login");
	disp.forward(request, response);
} 

%>
<html>
<head>
  <title>Administrator Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>




	

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Mercury</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Eventi in Attesa</a></li>
      <li><a href="#">Gestisci Eventi</a></li>
      <li><a href="#">Enti in Attesa</a></li>
      <li><a href="#">Gestisci Enti</a></li>
      <li><a href="#">Gestisci Categorie</a></li>
    </ul>
  </div>
</nav>
  
<div style="height:40%; width:80%"class="container">
<% if (session.getAttribute("attesa")!=null)
{
%>

  <h3>Lista Eventi</h3>
  
  <table border="1" style="width:100%">

	<tr>
		<th>Evento</th>
		<th>Descrizione</th>
		<th>Data Inizio - Data Fine</th>
		<th>Gestisci</th>
	</tr>
	
	<c:forEach var="j" items="${sessionScope.attesa}">
		<tr>
			<td><c:out value="${j.nome_evento} - "></c:out></td>
			<td><c:out value="${j.descrizione}"></c:out></td>
			<td><c:out value="${j.data_inizio}"></c:out><c:out value="${j.data_fine}"></c:out></td>
			<td style="width:100%"><button>Approva</button><button>Rifiuta</button></td>
			
			
		</tr>
	</c:forEach>
</table>
<% 
}
else
{ 
	out.print("Nessun Evento in Attesa");
}
%>


</div>

</body>
</html>