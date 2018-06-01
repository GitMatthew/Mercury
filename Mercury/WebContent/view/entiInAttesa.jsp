<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% if(session.getAttribute("user")==null)
{
	HttpSession sessionError = request.getSession();
	session.setAttribute("rst", "Per proseguire serve una sessione attiva. Effettua il Login");
	response.sendRedirect("view/loginAdmin.jsp");
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
      <li><a href="../ControllerAdmin?param=1">Gestisci Eventi</a></li>
      <li class="active"><a href="../ControllerAdmin?param=2">Enti in Attesa</a></li>
      <li><a href="../ControllerAdmin?param=3">Gestisci Enti</a></li>
      <li><a href="../ControllerAdmin?param=4">Gestisci Categorie</a></li>
    </ul>
  </div>
</nav></center>
  
<div style="height:40%; overflow: auto; width:80%"class="container">
<% if (session.getAttribute("enti_attesa")!=null)
{
%>

  <h3 Style="text-align:center; color:White">Lista Enti</h3>
  
  <table border="1" style="width:100%">

	<tr style="color:White">
		<th>Ente</th>
		<th>Descrizione</th>
		<th>Email</th>
		<th>Gestisci</th>
	</tr>
	
	<c:forEach var="j" items="${sessionScope.enti_attesa}">
		<tr style="color:White">
			<td><c:out value="${j.nome_ente}"></c:out></td>
			<td><c:out value="${j.descrizione_ente}"></c:out></td>
			<td><c:out value="${j.email_ente}"></c:out>
			<td style="width:140px" align="center"><button style="width:65px ; color:Black" onclick="location.href='../ControllerAdmin?param=mod_stat_ente&id_ente=${j.id_ente}&id_status=2'">Approva</button><button style="width:65px ; color:Black" onclick="location.href='../ControllerAdmin?param=mod_stat_ente&id_ente=${j.id_ente}&id_status=3'">Rifiuta</button></td>
			  
		</tr>
	</c:forEach>
</table>
<% 
}
else
{ 
	out.print("Nessun Ente in Attesa");
}
%>


</div>

</body>
</html>