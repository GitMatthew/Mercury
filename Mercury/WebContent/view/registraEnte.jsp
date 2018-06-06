<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
<% if(request.getAttribute("messaggio")!=null) { %>   	
<h6 ><%=request.getAttribute("messaggio")%></h6>	
<% } else {	%>	
<h6 >Compila tutti campi per iscriverti !</h6> 
<% } %>

<% session.setAttribute("from" , "registraEnte"); %>    
<form action="/Mercury_Mercury/ControllerEnte" method=post>      
	<center>
		<table width="100%">
			<table width="50%">
				<tr>
					<td >
						<label for=user_ente><b><i>Username*</i></b></label> 
							<br> 
								<input type="text" value="" name="user_ente">  
					</td>
					<td >
							<label for=psw_ente><b><i>Password*</i></b></label> 
							<br> 
							<input type="text" value="" name="psw_ente">   
					</td>
				</tr>
				<tr>
					<td>
						<label for=nome_ente><b><i>Nome Ente*</i></b></label> 
						<br> 
						<input type="text" value="" name="nome_ente">
					</td>
					<td>	
						<label for=email_ente><b><i>Email*</i></b></label> 
						<br> 
						<input type="email" value="" name="email_ente"placeholder="g.@yahoo.it">
					</td>
				</tr>
				<tr>
					<td>
						<label for=telefono_ente><b><i>Telefono*</i></b></label> 
						<br> 
						<input type="tel" value="" name="telefono_ente">
					</td>
					<td>
						<label for=url_img_ente><b><i>Immagine Ente</i></b></label> 
						<br> 
						<input type="text" value=""  placeholder="http://www.immagine.it" name="url_img_ente" >  	
					</td>		
				</tr>
			</table>
			<table width="50%">
				<tr>
					<td>
						<label for=url_sito_ente><b><i>Sito Ente</i></b></label> 
						<br> 
						<input type="text" value="" name="url_sito_ente" placeholder="http://www.sito.it" size="37">  
					</td>
				</tr>
				<tr>
					<td>
					
						<label for=descrizione_ente><b><i>Descrizione Ente</i></b></label>  
					</td>
				</tr>
				<tr>
					<td>
						<textarea name="descrizione_ente" maxlenght="80" cols="68" rows="5" ></textarea>
					
					</td>
				
				</tr>
			
			</table>
			<br>

	   <input type="submit">  
	</table>
</center>   
</form>

     <br><br>
     <h5 type=color:red>I campi contrassegnati da asterisco(*) sono OBBLIGATORI !</h5>
	 <br>

	<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>Footer</p>
	</div>


</body>
</html>