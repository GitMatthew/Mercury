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
<title>Insert title here</title>
</head> 
<body>

<h1>GESTISCI EVENTI</h1>

<%= request.getAttribute("messaggio") %>
<h1 value="messaggio"></h1>

    <form action="/Mercury_Mercury/ControllerEnte" method=get>
    <a href=/Mercury_Mercury/ControllerEnte?pag=1>CREA NUOVO EVENTO</a>   
    <a href=/Mercury_Mercury/ControllerEnte?pag=2>GESTISCI EVENTO</a>   
    <a href=/Mercury_Mercury/ControllerEnte?pag=3>GESTISCI ACCOUNT</a> 
 
 
 
 
 
 
 <div style="height:40%; overflow: auto; width:80%"class="container">
  
	    <table border="1" style="width:100%">

	<tr>
		<th>Nome Evento</th>
		<th>Descrizione</th>
		<th>Data Inizio</th>
		<th>Data Fine</th>
		<th>Status</th>
		<th>Categoria</th>
		<th>Comune</th>
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
		</tr>
	</c:forEach>
</table>

    </form>

</body>
</html>