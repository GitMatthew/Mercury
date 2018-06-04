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
<title>Bootstrap 4 Website Example</title>
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

</head>
<body>
 
<nav class="navbar navbar-expand-lg navbar-dark bg-dark noSpace">
	<a class="navbar-brand noSpace" href="../ControllerHomepage?da=0"><img
		class="noSpace" style="width: 150px; height: 60px;"
		src="../images/logo.jpg"> </a>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active spaziaLato"><a class="nav-link"
				href="../ControllerHomepage?da=0">HOME</a></li>
			
		</ul>
	</div>
</nav>

<center>

<h1>CREA EVENTO</h1>
<%= request.getAttribute("messaggio") %>
<h1 value="messaggio"></h1>

 <form action="/Mercury_Mercury/ControllerEnte" method=get>
    <a href=/Mercury_Mercury/ControllerEnte?pag=1>CREA NUOVO EVENTO</a>   
    <a href=/Mercury_Mercury/ControllerEnte?pag=2>GESTISCI EVENTO</a>   
    <a href=/Mercury_Mercury/ControllerEnte?pag=3>GESTISCI ACCOUNT</a>   
 </form>
 <form action="/Mercury_Mercury/ControllerEnte" method=post >
			<table width="100%">
				<table width="50%">
					<tr>
						<td>
							<label>Nome Evento*</label> 
							<br>
							<input type="text" name="nomeEvento">
						</td>
					
						<td>
							<label>Seleziona tipologia di Evento*</label> 
								<br> 
								<select name="id_categoria"> 
									<optgroup label ="Categoria">         
										 <c:forEach var="j" items="${requestScope.categorie}">	            				
											  <option value="${j.id_categoria}">${j.nome_categoria}</option>	              
										 </c:forEach>  	           
									</optgroup>         
								</select>
						<td>
					</tr>
					<tr>
						<td style="text-align:right"> 
							<label><b><i>Periodo evento</b></i></label>
						</td>
					</tr>
					<tr>
						<td>
							<label>Dal* :</label> 
							
							<input type="date" id="inizio" name="dataInizio">
						</td>
						<td>
							<label>al* :</label>  
							
							<input type="date" id="fine" name="dataFine">
						</td>
					</tr>
				</table>
		   
						
			<table width="50%">   
			
				<tr>
					<td>
			
						<label>Regione </label> 
					</td>
				
					<td>
						<label>Provincia </label> 
					</td>
					<td>
						<label>Comune </label> 
					</td>
				</tr>
						
					</td>
				<tr>
					<td>

						<select name="id_regione"> 
							<optgroup label ="Regione">         
								 <c:forEach var="j" items="${requestScope.regioni}">	            				
									  <option value="${j.id_regione}">${j.nome_regione}</option>	              
								 </c:forEach>  	           
							</optgroup>         
						</select>

					</td>
					<td>
						<select name="id_provincia"> 
							<optgroup label ="Provincia">         
								<c:forEach var="j" items="${requestScope.regioni}">	            				
								<option value="${j.id_regione}">${j.nome_regione}</option>	              
								</c:forEach>  	           
							</optgroup>         
						</select>
					</td>
					
					<td>
					
							<select name="id_comune"> 
								<optgroup label ="Comune">         
									 <c:forEach var="j" items="${requestScope.comuni}">	            				
										  <option value="${j.id_comune}">${j.nome_comune}</option>	              
									 </c:forEach>  	           
								</optgroup>         
							</select>
					</td>

				</tr>
				
				<tr>
					<td>	
						
						<label>Location o Indirizzo*</label> 
						
						<input type="text" name="indirizzo">
					
					</td>
					<td>
						<label>Sito web </label> 
						<input name="url_sito_evento" placeholder="http://www.sito.it"> </input> 
					</td>
					<td>
						<label>Inserisci immagine</label>
						 <input name="url_img_evento" placeholder="http://www.immagine.it">  
					</td>
				</tr>
				
					
			</table>
		</table>
	

		<label>Descrizione Evento :</label> 
					<br>
				   <textarea name="descrizione" maxlenght="100" cols="35" rows="5" value="descrizione"></textarea>
					<br><br>
					<h5 type=color:red>I campi contrassegnati da asterisco(*) sono OBBLIGATORI !</h5>
					<br>
    
					<input type="submit">
</form>					

		<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>Footer</p>
		</div>
	</center>

</body>
</html>