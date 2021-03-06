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
<title>Ente</title> 
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
<h1 class="scrittabianca">MODIFICA EVENTO</h1>
<% if(request.getAttribute("messaggio")!=null) { %>   	
<h3 class="scrittabianca"><%=request.getAttribute("messaggio")%></h3>	
<% } else {	%>	
<h3 class="scrittabianca">Benvenuto su Mercury !</h3> 
<% } %>

  <br><br>
  </div>
  
  <div align="center" class="row sticky-top  banner01"
		style="overflow: auto; padding: 10px; margin: 0px; min-width: 100%; max-width: 100%; background-color: rgba(128, 0, 0, 0.4);">

		<div class="col">
			<a href="/Mercury_Mercury/ControllerEnte?pag=1"  class="linkAPRIricerca banner01 ">
				NUOVO EVENTO </a>
				</div>
        
		<div class="col">
			<a href="/Mercury_Mercury/ControllerEnte?pag=2"  class="linkAPRIricerca banner01 ">
				GESTISCI EVENTO </a>
				</div>

		<div class="col">
			<a href="/Mercury_Mercury/ControllerEnte?pag=3"  class="linkAPRIricerca banner01">
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
                                              <c:if test="${j.id_categoria == requestScope.evento.id_categoria}">
                                                   <option value="${j.id_categoria}" selected="selected">${j.nome_categoria}</option>
                                              </c:if>
                                              <c:if test="${j.id_categoria != requestScope.evento.id_categoria}">
                                                   <option value="${j.id_categoria}">${j.nome_categoria}</option>
                                              </c:if>											              
										 </c:forEach>  	           
									</optgroup>         
								</select>
						<td>
					</tr>
					<tr>
						<td>
							<label><b><i>Cambia Periodo evento</i></b></label>
							<br>
							<label>Dal* :</label> 
							
							<input type="date" id="inizio" name="dataInizio" value="${requestScope.data_inizio}">
							
							<label>al :</label>  
							
							<input type="date" id="fine" name="dataFine" value="${requestScope.data_fine}">
						</td>
					</tr>
				</table>
		   
			
			
		 
			<table width="50%"> 
			
			<script>
					
					$(document).ready(function() {						

						$("#id_regione").change(function() {
							
							
							$.ajax({type : 'POST',
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
															
															var x1 =0;
															var x2 = 0;
															for ( var i in json.pro22) {
																x2 =0 ;
																for ( var j in json.pro23) {
																	if(x2==x1){
																		$('#id_provincia').append('<option value="'+json.pro22[i]+'">'+ json.pro23[j]+ '</option>');
																		
																	}
																
																	x2=x2+1;
																}
															x1 = x1+1 ;
																}
															
														
													}
													
							  			});

										});

						$("#id_provincia").change(function() {
						
							$.ajax({
														type : 'POST',
														data : {provincia : $("#id_provincia").val(),dap : "1"},
														url : '/Mercury_Mercury/ControllerHomepage',
														success : function(result) {
															
															
															var vCom = [];
															vCom.push(result);
															var json = JSON.parse(result);
															$('#id_comune').empty();
															$('#id_comune').append('<option value="null">seleziona</option>');
												
															var x1 =0;
															var x2 = 0;
															for ( var i in json.com22) {
																x2 =0 ;
																for ( var j in json.com23) {
																	if(x2==x1){
																		$('#id_comune').append('<option value="'+json.com22[i]+'">'+ json.com23[j]+ '</option>');
																		
																	}
																
																	x2=x2+1;
																}
															x1 = x1+1 ;
																}
														}
													});

										});	});
					
					
					</script>	
				<tr>
					<td>
				
						<label><b><i>Regione</i></b></label> 
					</td>
				
					<td>
						<label><b><i>Provincia</i></b></label> 
					</td>
					<td>
						<label><b><i>Comune*</i></b></label> 
					</td>
				</tr>
						
				<tr>
					<td>
                        <select  id= 'id_regione'>
                        <option id='primoReg'  value='null'> seleziona </option>
			        <c:forEach var="j" items="${sessionScope.reg22}">
				<option  value="<c:out value="${j.id_regione}"></c:out>"> <c:out value="${j.nome_regione}"></c:out>	 </option> 
			        </c:forEach>	
			
			</select>

					</td>
					<td>
						<select id="id_provincia" name="id_provincia" class="select"> 
							     <option >Provincia Precedente</option>
						</select>
					</td>
					
					<td>
					
							<select id="id_comune" name="id_comune" class="select">   
							     <option value="${requestScope.evento.id_comune}" selected="selected">Comune Precedente</option>	         
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
					<label for=descrizione><b><i>Descrizione</i></b></label> 
				</td>
			</tr>
			<tr>
				<td>
				    <textarea name="descrizione" maxlength="500" cols="80" rows="5" >${requestScope.evento.descrizione}</textarea>
				
				</td>		
			</tr>
			
		</table>
		<br>					
		<center>	<input type="submit">	</center>				
					
</form>					

		<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>Footer</p>
		</div>
	</center>

</body>
</html>