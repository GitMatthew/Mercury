<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% if(session.getAttribute("admin")==null) 
{
	HttpSession sessionError = request.getSession();
	session.setAttribute("rst", "Per proseguire serve una sessione attiva. Effettua il Login");
	response.sendRedirect("loginAdmin.jsp");
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
<body Background=../images/adminLoginBg.jpg>



<center><nav style="display:inline-block" class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="../ControllerHomepage?da=0">Mercury</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="adminHome.jsp">Eventi in Attesa</a></li>
      <li class="active"><a href="../ControllerAdmin?param=1">Gestisci Eventi</a></li>
      <li><a href="../ControllerAdmin?param=2">Enti in Attesa</a></li>
      <li><a href="../ControllerAdmin?param=3">Gestisci Enti</a></li>
      <li><a href="../ControllerAdmin?param=4">Gestisci Categorie</a></li>
      <li><a href="../ControllerAdmin?param=5">Logout</a></li> 
    </ul>
  </div>
</nav></center>
  
<div style="height:40%; overflow: auto; width:80%"class="container">
<% if (session.getAttribute("gestione_eventi")!=null)
{
%>

 <h3 Style="text-align:center; color:White">Lista Eventi</h3>
 
  <table style="width:100%;color:White">
  <tr style="color:White">
		<th style="width:180px">Evento</th>
		<th style="width:340px">Descrizione</th>
		<th style="width:180px">Data Inizio - Data Fine</th>
		<th style="width:110px">Status</th>
		<th><center>Gestisci</center></th>
	</tr>
 </table>
 <div style="height:430px; overflow:auto;">
 <table border="1" style="width:100%; table-layout: fixed;">
	<c:forEach var="j" items="${sessionScope.gestione_eventi}">
		<tr style="color:White">
			<td style="width:172px">&nbsp;<c:out value="${j.nome_evento}"></c:out></td>
			<td style="width:350px; word-wrap:break-word;">&nbsp;<c:out value="${j.descrizione}"></c:out></td>
			<td style="width:140px;height:auto"><center><c:out value="${j.data_inizio}"></c:out><br><c:out value="${j.data_fine}"></c:out></center></td>
			<td><center><c:out value="${j.nome_status}"></c:out></center></td>
			<td style="width:140px" align="center">
			<c:if test="${j.id_status==3}"><button style="width:65px; color:Black" onclick="location.href='../ControllerAdmin?param=mod_ev&id_evento=${j.id_evento}&id_status=2'">Approva</button></c:if>
			<c:if test="${j.id_status==2}"><button style="width:65px; color:Black" onclick="location.href='../ControllerAdmin?param=mod_ev&id_evento=${j.id_evento}&id_status=3'">Rifiuta</button></c:if></td>
		</tr>
	</c:forEach>
</table>
</div>
<% 
}
else
{ 
	out.print("<a style='color:White'>Nessun Evento Trovato</a>");
}
%>


</div>

</body>
</html>