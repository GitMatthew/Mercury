<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 


if(session.getAttribute("user")==null)
{
	HttpSession sessione= request.getSession();
	sessione.setAttribute("rst", "Per proseguire serve una sessione attiva. Effettua il Login");
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
      <li><a href="../ControllerAdmin?param=1">Gestisci Eventi</a></li>
      <li><a href="../ControllerAdmin?param=2">Enti in Attesa</a></li>
      <li><a href="../ControllerAdmin?param=3">Gestisci Enti</a></li>
      <li class="active"><a href="../ControllerAdmin?param=4">Gestisci Categorie</a></li>
    </ul>
  </div>
</nav></center>
  
<div style="height:40%; overflow: auto; width:80%"class="container">
<% if (session.getAttribute("tutte_le_cat")!=null)
{
%>

   <h3 Style="text-align:center; color:White">Lista Categorie</h3>
  	
  	<button style="width:150px; color:Black; align:center" onclick="myFunction(0)">Aggiungi Nuova Categoria</button>
  	
  	<table border="1" style="width:100%">
		<tr style="color:White">
			<th>Nome Categoria</th>
			<th>Gestisci</th>
		</tr>
	
	<c:forEach var="j" items="${sessionScope.tutte_le_cat}">
		<tr style="color:White">
			<td><center><c:out value="${j.nome_categoria}"></c:out></center></td>
			<td style="width:140px" align="center">
			<c:if test="${j.nome_categoria != 'altro'}">
				<button style="width:65px; color:Black" onclick="myFunction('${j.id_categoria}')">Modifica</button>
			</c:if></td>
		</tr>

		
		<c:if test="${j.nome_categoria != 'altro'}">
		<tr id="input${j.id_categoria}" style="display:none; width:100% ; color:White" align="center">
		<td colspan="2" style="width:100%; border:none; colspan:2"><form action="ControllerAdmin?param=0" method="get">
			Modifica Categoria &nbsp; <input style="color:Black" type="text" name="cat" /><input style="color:Black" type="submit"/><input style="color:Black" type="reset" />
		</form></td></tr></c:if>

	</c:forEach>
		</table>
	<table border="none" align="center">
		<tr id="input" style="display:none; width:100%; color:White" align="center" colspan="2">
		<td style="width:100%;">
		<form action="../ControllerAdmin" method="get">
			Modifica Categoria &nbsp;
			<input type="hidden" value="" id="id_cat" name="id_cate"/>
			<input type="hidden" value="mod_cat" id="action" name="param" />
			<input style="color:Black" type="text" name="cat" />
			<input style="color:Black" type="submit"/>
			<input style="color:Black" type="reset" />
		</form></td> 
		</tr>
	</table>
	
<script>
function myFunction(t) {
	var x=document.getElementById("input");
	var y=document.getElementById("action");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
	if(t!=0){
	var o=document.getElementById("id_cat");
	o.value=t;
	}else{
		y.value="new_cat";
	}
}
</script>

<% 
}
else
{ 
	out.print("Nessuna Categoria Trovata");
}
%>


</div>

</body>
</html>
