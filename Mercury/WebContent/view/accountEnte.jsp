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
	
	<style>
a.linkAPRIricerca {
	padding: 10px;
	background-color: #f44336;
	color: white;
	padding: 5px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	background-color: #f44336;
}

a.linkAPRIricerca:hover {
	background-color: #A52A2A;
	color: #FF8C00;
}

#catSELEZIONATO, #regSELEZIONATO, #proSELEZIONATO, #comSELEZIONATO {
	max-width: 150px !important;
}

.boxDestra {
	width: 100%;
	height: 300px;
	margin-left: 8px;
	background-repeat: no-repeat;
	background-position: center;
	background-size: contain;
}

#box1 {
	background-image: url('../images/newsletter.jpg');
}

#box2 {
	background-image: url('../images/registraEnte.jpg');
}

#box3 {
	background-image: url('../images/publi1.jpg');
}

#box4 {
	background-image: url('../images/publi2.jpg');
}

.spaziaLato {
	padding: 0px 20px 0px 20px;
}

.tabDATA {
	min-width: 120px !important;
}

.noSpace {
	padding: 0px !important;
	margin: 0px !important;
}

.appari {
}


.scompari {
}

provaBG{background-color:blue;}

</style>
</head>
<body style="text-align:center">

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
			
			</div>
		</ul>
		<div >
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active spaziaLato"><a class="nav-link"
				href="/Mercury_Mercury/ControllerEnte?pag=6">LOG OUT</a></li>
			
		</ul>
	</div>
	</div>
	</nav>

<h1>GESTISCI ACCOUNT</h1>
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
    
  <form action="/Mercury_Mercury/ControllerEnte" method="post">
  <center>
	<table width="100%">
		<table width="50%">
			<tr>
				<td>
					<label for=user_ente>Username</label> 
    					<br> 
    						<input type="text" value="${requestScope.ente.user_ente}" name="user_ente">  
				</td>
				<td>  
 						<label for=psw_ente>Password</label> 
   						<br> 
    					<input type="text" value="${requestScope.ente.psw_ente}" name="psw_ente">   
				</td>
			</tr>
			<tr>
				<td>
					<label for=nome_ente>Nome Ente</label> 
    				<br> 
    				<input type="text" value="${requestScope.ente.nome_ente}" name="nome_ente">
 				</td>
				<td>	
					<label for=email_ente>Email</label> 
    				<br> 
    				<input type="email" value="${requestScope.ente.email_ente}" name="email_ente"placeholder="g.@yahoo.it">
				</td>
			</tr>
			<tr>
				<td>
					<label for=telefono_ente>Telefono</label> 
    				<br> 
    				<input type="tel" value="${requestScope.ente.telefono_ente}" name="telefono_ente">
				</td>
				<td>
					<label for=url_img_ente>Immagine Ente</label> 
    				<br> 
    				<input type="url" value="${requestScope.ente.url_img_ente}" name="url_img_ente" placeholder="www.immagine.it">  	
				</td>		
			</tr>
		</table>
		<table width="50%">
			<tr>
				<td>
					<label for=url_sito_ente>Sito Ente</label> 
				    <br> 
				    <input type="url" value="${requestScope.ente.url_sito_ente}" name="url_sito_ente" placeholder="www.sito.it" size="37">  
				</td>
			</tr>
			<tr>
				<td>
				
					<label for=descrizione_ente>Descrizione Ente</label> 
				</td>
			</tr>
			<tr>
				<td>
				    <textarea name="descrizione_ente" maxlenght="80" cols="47" rows="5" >${requestScope.ente.descrizione_ente}</textarea>
				
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