<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import="com.corso.connection.Dao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<div >
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active spaziaLato"><a class="nav-link"
				href="/Mercury_Mercury/ControllerEnte?pag=6">LOG OUT</a></li>
			
		</ul>
	</div>
</nav>

<center>

<h1>MODIFICA EVENTO</h1>
<% if(request.getAttribute("messaggio")!=null) { %>   	
<h6 ><%=request.getAttribute("messaggio")%></h6>	
<% } else {	%>	
<h6 >Benvenuto su Mercury !</h6> 
<% } %>

  <div align="center" class="row sticky-top"
		style="overflow: auto; padding: 10px; margin: 0px; min-width: 100%; max-width: 100%; background-color: rgba(128, 0, 0, 0.4);">

		<div class="col">
			<a href="/Mercury_Mercury/ControllerEnte?pag=1"  class="linkAPRIricerca">
				NUOVO EVENTO </a>
				</div>
        
		<div class="col">
			<a href="/Mercury_Mercury/ControllerEnte?pag=2"  class="linkAPRIricerca">
				GESTISCI EVENTO </a>
				</div>

		<div class="col">
			<a href="/Mercury_Mercury/ControllerEnte?pag=3"  class="linkAPRIricerca">
				GESTISCI ACCOUNT </a>
				</div>	
						  
	</div>
	<br>
 
 <form action="/Mercury_Mercury/ControllerEnte?id_evento=${requestScope.evento.id_evento}" method=post >
				<table width="100%">
				<table width="50%">
					<tr>
						<td>
							<label><b><i>Cambia Nome Evento</i></b></label> 
							<br>
							<input type="text" name="nomeEvento" value="${requestScope.evento.nome_evento}">
						</td>
					
						<td>
							<label><b><i>Cambia tipologia di Evento</i></b></label> 
								<br> 
								<select name="id_categoria" class="selectpicker"> 
									<optgroup label ="Categoria">      
										 <c:forEach var="j" items="${requestScope.categorie}" >	            				
											  <option value="${j.id_categoria}">${j.nome_categoria}</option>	              
										 </c:forEach>  	           
									</optgroup>         
								</select>
						<td>
					</tr>
					<tr>
						<td>
							<label><b><i>Cambia Periodo evento</i></b></label>
							<br>
							<label>Dal :</label> 
							
							<input type="date" id="inizio" name="dataInizio" value="${requestScope.data_inizio}">
							
							<label>al :</label>  
							
							<input type="date" id="fine" name="dataFine" value="${requestScope.data_fine}">
						</td>
					</tr>
				</table>
		   
			
			
		 
			<table width="50%"> 
			
			<script>
					
					$(document).ready(function() {						

								$("#id_regione").change(function() {$.ajax({type : 'POST',
															data : {regione : $("#id_regione").val(),dap : "0"},
															url : '/Mercury_Mercury/ControllerHomepage',
															success : function(result) {
																	var vPro = [];
																	vPro.push(result);
																	var json = JSON.parse(result);
																	$('#id_provincia').empty();
																	$('#id_comune').empty();
																	$('#id_provincia').append('<option value="null">seleziona</option>');
																	$('#id_comune').append('<option value="null">seleziona</option>');
																	for ( var i in json.pro22) {
																		$('#id_provincia').append('<option value="'+json.pro22[i]+'">'+ json.pro22[i]+ '</option>')
																	}
																}
															});

												});

								$("#id_provincia").change(function() {$.ajax({
																type : 'POST',
																data : {provincia : $("#id_provincia").val(),dap : "1"},
																url : '/Mercury_Mercury/ControllerHomepage',
																success : function(result) {
																	var vCom = [];
																	vCom.push(result);
																	var json = JSON.parse(result);
																	$('#id_comune').empty();
																	$('#id_comune').append('<option value="null">seleziona</option>');
																	for ( var i in json.com22) {
																		$('#id_comune').append('<option value="'+json.com22[i]+'">'+ json.com22[i]+ '</option>')
																	}
																}
															});

												});	});
					
					
					</script>	<%
		Connection conn = null;
		conn = Dao.getConnection();
		Statement x = null;
		ResultSet rs = null;
	%>  
			
				<tr>
					<td>
				
						<label><b><i>Regione</i></b></label> 
					</td>
				
					<td>
						<label><b><i>Provincia</i></b></label> 
					</td>
					<td>
						<label><b><i>Comune</i></b></label> 
					</td>
				</tr>
						
				<tr>
					<td>
                         <%
					try {
						x = conn.createStatement();
						rs = x.executeQuery("select nome_regione from regioni order by nome_regione ASC; ");
						
						out.print("<select  id= 'id_regione' class='selectpicker'>");
						out.print("<option id='primoReg'  value='null'> seleziona </option> ");
						while (rs.next()) {
							out.print("<option value='" + rs.getString("nome_regione") + "'>");
							out.print(rs.getString("nome_regione"));
							out.print("</option>");
						}
						out.print("</select>");
					}
					catch (Exception e) {
						out.println("wrong entry" + e); 
					}
				%>
						

					</td>
					<td>
						<select id="id_provincia" name="id_provincia" class="selectpicker"> 
							     
						</select>
					</td>
					
					<td>
					
							<select id="id_comune" name="id_comune" class="selectpicker">   
								         
							</select>
					</td>

				</tr>
				
				<tr>
					<td>
						<label><b><i>Cambia Sito web</i></b></label> 
						<input name="url_sito_evento" placeholder="http://www.sito.it" value="${requestScope.evento.url_sito_evento}"> </input> 
					</td>
				
					<td>
						<label><b><i>Cambia immagine</i></b></label>
						 <input name="url_img_evento" placeholder="http://www.immagine.it" value="${requestScope.evento.url_img_evento}">  
					</td>
			</table>  
		</table>
	
		<table width="50%">
			<tr>
				<td>
					<label for=descrizione_ente><b><i>Descrizione Ente</i></b></label> 
				</td>
			</tr>
			<tr>
				<td>
				    <textarea name="descrizione_ente" maxlenght="80" cols="80" rows="5" >${requestScope.evento.descrizione}</textarea>
				
				</td>		
			</tr>
			<center>
				<tr>
					<td>
						<input type="submit">
					</td>
				</tr>
			</center>
		</table>					
								
					
</form>					

		<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>Footer</p>
		</div>
	</center>

</body>
</html>