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
<body style="text-align:center">


<nav class="navbar navbar-expand-lg navbar-dark bg-dark noSpace">
	<a class="navbar-brand noSpace" href="/Mercury_Mercury/ControllerHomepage?da=0"><img
		class="noSpace" style="width: 150px; height: 60px;"
		src="/Mercury_Mercury/images/logo.jpg"> </a>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active spaziaLato"><a class="nav-link"
				href="/Mercury_Mercury/ControllerHomepage?da=0">HOME</a></li>
			
			</div>
		</ul>
	</div>
	</nav>


<h1>REGISTRAZIONE</h1>

    
<form action="/Mercury_Mercury/ControllerEnte" method=post>      
	<center>
		<table width="100%">
			<table width="50%">
				<tr>
					<td >
						<label for=user_ente>Username</label> 
							<br> 
								<input type="text" value="" name="user_ente">  
					</td>
					<td >
							<label for=psw_ente>Password</label> 
							<br> 
							<input type="password" value="" name="psw_ente">   
					</td>
				</tr>
				<tr>
					<td>
						<label for=nome_ente>Nome Ente</label> 
						<br> 
						<input type="text" value="" name="nome_ente">
					</td>
					<td>	
						<label for=email_ente>Email</label> 
						<br> 
						<input type="email" value="" name="email_ente"placeholder="g.@yahoo.it">
					</td>
				</tr>
				<tr>
					<td>
						<label for=telefono_ente>Telefono</label> 
						<br> 
						<input type="tel" value="" name="telefono_ente">
					</td>
					<td>
						<label for=url_img_ente>Immagine Ente</label> 
						<br> 
						<input type="url" value="" name="url_img_ente" placeholder="www.immagine.it">  	
					</td>		
				</tr>
			</table>
			<table width="50%">
				<tr>
					<td>
						<label for=url_sito_ente>Sito Ente</label> 
						<br> 
						<input type="url" value="" name="url_sito_ente" placeholder="www.sito.it" size="37">  
					</td>
				</tr>
				<tr>
					<td>
					
						<label for=descrizione_ente>Descrizione Ente</label> 
						
						<textarea name="descrizione" maxlenght="100" cols="67" rows="5" > 
						</textarea>
					
					</td>
				
				</tr>
			
			</table>
			<br>

	   <input type="submit">  
	</table>
</center>   
</form>

	<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>Footer</p>
	</div>


</body>
</html>