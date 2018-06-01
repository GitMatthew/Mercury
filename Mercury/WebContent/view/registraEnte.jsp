<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:grey">

<h1>MODULO DI REGISTRAZIONE ENTE</h1>

<form action="../ControllerRegistrazione" method="getPost">

<label for=nome_ente>Nome Ente</label> 
    <br> 
    <input type="text" value="" name="nome_ente">
    
   	
  
<br> 	
   	
<label for=email_ente>Email</label> 
    <br> 
    <input type="text" value="" name="email_ente">

<br>    

<label for=user_ente>Username</label> 
    <br> 
    <input type="text" value="" name="user_ente">  
<br>    
 <label for=psw_ente>Password</label> 
    <br> 
    <input type="text" value="" name="psw_ente">    
    
<br>    
 <label for=telefono_ente>Telefono</label> 
    <br> 
    <input type="text" value="" name="telefono_ente">
   
 <br>    
 <label for=descrizione_ente>Descrizione Ente</label> 
    <br> 
    <input type="text" value="" name="descrizione_ente"> 
    
  <br>    
 <label for=url_sito_ente>Sito Ente</label> 
    <br> 
    <input type="text" value="" name="url_sito_ente">   
    
  <br>    
 <label for=url_img_ente>Immagine Ente</label> 
    <br> 
    <input type="text" value="" name="url_img_ente">    	
<br>   
<br>
<button type="submit" class="">Invia</button>
</form>



</body>
</html>