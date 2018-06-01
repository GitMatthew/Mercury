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

	

<center><nav style="display:inline-block" class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="../ControllerHomepage?da=0">Mercury</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="adminHome.jsp">Eventi in Attesa</a></li>
      <li><a href="../ControllerAdmin?param=1">Gestisci Eventi</a></li>
      <li><a href="../ControllerAdmin?param=2">Enti in Attesa</a></li>
      <li class="active"><a href="../ControllerAdmin?param=3">Gestisci Enti</a></li>
      <li><a href="../ControllerAdmin?param=4">Gestisci Categorie</a></li>
    </ul>
  </div>
</nav></center>
  
<div style="height:40%; overflow: auto; width:80%"class="container">
<% if (session.getAttribute("tutti_enti")!=null)
{
%>

  <h3 Style="text-align:center">Lista Enti</h3>
  
  <table border="1" style="width:100%">

	<tr>
		<th>Evento</th>
		<th>Descrizione</th>
		<th>Status</th>
		<th>Gestisci</th>
	</tr>
	
	<c:forEach var="j" items="${sessionScope.tutti_enti}">
		<tr>
			<td><c:out value="${j.nome_ente}"></c:out></td>
			<td><c:out value="${j.descrizione_ente}"></c:out></td>
			<td><c:out value="${j.nome_status}"></c:out></td>
			<td style="width:205px" align="center">
			<c:if test="${j.id_status==3 || j.id_status==4 }"><button style="width:65px" onclick="location.href='../ControllerAdmin?param=mod_ente&id_ente=${j.id_ente}&id_status=2'">Approva</button></c:if>
			<c:if test="${j.id_status==2}"><button style="width:65px" onclick="location.href='../ControllerAdmin?param=mod_ente&id_ente=${j.id_ente}&id_status=3'">Rifiuta</button></c:if>
			<c:if test="${j.id_status==2 || j.id_status==3}"><button style="width:65px" onclick="location.href='../ControllerAdmin?param=mod_ente&id_ente=${j.id_ente}&id_status=4'">Blocca</button></c:if></td>
		</tr>
	</c:forEach>
</table>
<% 
}
else
{ 
	out.print("Nessun ente trovato");
}
%>


</div>

</body>
</html>