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

<style>

/* body */
/* { */
/* 	background-image: url("sfondo.jpg"); */
/* } */


</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>GESTISCI ACCOUNT</h1>

    <form action="/Mercury_Mercury/ControllerEnte" method=get>
    <a href=/Mercury_Mercury/ControllerEnte?pag=1>CREA NUOVO EVENTO</a>   
    <a href=/Mercury_Mercury/ControllerEnte?pag=2>GESTISCI EVENTO</a>   
    <a href=/Mercury_Mercury/ControllerEnte?pag=3>GESTISCI ACCOUNT</a>   
    </form>
    
  <form action="../ControllerRegistrazione" method="getPost">
	<table width="100%">
		<table width="50%">
			<tr>
				<td>
					<label for=user_ente>Username</label> 
    					<br> 
    						<input type="text" value="" name="user_ente">  
				</td>
				<td>  
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
    				<input type="url" value="" name="url_img_ente">  	
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
				</td>
			</tr>
			<tr>
				<td>
				    <textarea name="descrizione" maxlenght="80" cols="47" rows="5" > 
					</textarea>
				
				</td>
			
			</tr>
		
		</table>
<br>
<button type="submit" class="">Invia</button>






</table>
</form>
    

</body>
</html>