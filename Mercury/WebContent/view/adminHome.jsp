<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% if(session.getAttribute("admin")==null) 
{
	HttpSession sessionError = request.getSession();
	sessionError.setAttribute("rst", "Per proseguire serve una sessione attiva. Effettua il Login");
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
      <li class="active"><a href="adminHome.jsp">Eventi in Attesa</a></li>
      <li><a href="../ControllerAdmin?param=1">Gestisci Eventi</a></li>
      <li><a href="../ControllerAdmin?param=2">Enti in Attesa</a></li>
      <li><a href="../ControllerAdmin?param=3">Gestisci Enti</a></li>
      <li><a href="../ControllerAdmin?param=4">Gestisci Categorie</a></li>
      <li><a href="../ControllerAdmin?param=5">Logout</a></li> 
    </ul>
  </div>
</nav></center>
  
<div style="height:40%; overflow: auto; width:80%"class="container">
<% if (session.getAttribute("attesa")!=null)
{
%>

  <h3 Style="text-align:center; color:White">Lista Eventi</h3>
  <table style="width:100%;color:White">
  <tr style="colro:White">
 		<th style="width:110px">Immagine</th> 
	 	<th style="width:172px">Evento</th> 
		<th style="width:177px">Descrizione</th>
		<th style="width:514px">Data Inizio - Data Fine</th>
		<th><center>Gestisci</center></th>
	</tr>
  </table>
  <div style="height:430px; overflow:auto;">
  <table border="1" style="width:100%">
	
	<c:forEach var="j" items="${sessionScope.attesa}">
		<tr style="color:White">
			<td><img style="width:auto;height:auto" src="<c:out value="${j.url_img_evento}"></c:out>"></td>
			<td>&nbsp;<c:out value="${j.nome_evento}"></c:out></td>
			<td>&nbsp;<c:out value="${j.descrizione}"></c:out></td>
			<td>&nbsp;<c:out value="${j.data_inizio}"></c:out> - <c:out value="${j.data_fine}"></c:out></td>
			<td style="width:140px" align="center"><button style="width:65px; color:Black" onclick="location.href='../ControllerAdmin?param=mod_stat&id_evento=${j.id_evento}&id_status=2'">Approva</button><button style="width:65px ; color:Black" onclick="location.href='../ControllerAdmin?param=mod_stat&id_evento=${j.id_evento}&id_status=3'">Rifiuta</button></td>
			
 
		</tr>
	</c:forEach>
</table>
</div>
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