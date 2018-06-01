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

<h1>CREA UN NUOVO EVENTO</h1> 

<%= request.getAttribute("messaggio") %>
<h1 value="messaggio"></h1>

    <form action="/Mercury_Mercury/ControllerEnte" method=get>
    <a href=/Mercury_Mercury/ControllerEnte?pag=1>CREA NUOVO EVENTO</a>   
    <a href=/Mercury_Mercury/ControllerEnte?pag=2>GESTISCI EVENTO</a>   
    <a href=/Mercury_Mercury/ControllerEnte?pag=3>GESTISCI ACCOUNT</a>   
    </form>
    
    <hr>
    
    <form action="/Mercury_Mercury/ControllerEnte" method=post >
    
    <label>Nome Evento</label> 
    <br>
    <input type="text" name="nomeEvento">
    
    <br><br>
    
    <label>Periodo evento</label>
    <br>
    <label>Dal :</label> 
    
    <input type="date" id="inizio" name="dataInizio">
    
    <label>al :</label>  
    
    <input type="date" id="fine" name="dataFine">
    
    <br><br>
    
    <label>Indirizzo</label> 
    <br>
    <input type="text" name="indirizzo">
    
    <br><br>
      
    <label>Selezione tipologia di Evento</label> 
    <br> 
    <select name="id_categoria"> 
        <optgroup label ="Categoria">         
             <c:forEach var="j" items="${requestScope.categorie}">	            				
	              <option value="${j.id_categoria}">${j.nome_categoria}</option>	              
	         </c:forEach>  	           
        </optgroup>         
    </select>
    
    <br><br>
    
    <label>Regione :</label> 
     
    <select name="id_regione"> 
        <optgroup label ="Regione">         
             <c:forEach var="j" items="${requestScope.regioni}">	            				
	              <option value="${j.id_regione}">${j.nome_regione}</option>	              
	         </c:forEach>  	           
        </optgroup>         
    </select> 
    
    <label>Provincia :</label> 
    <select name="id_provincia"> 
        <optgroup label ="Provincia">         
             <c:forEach var="j" items="${requestScope.regioni}">	            				
	              <option value="${j.id_regione}">${j.nome_regione}</option>	              
	         </c:forEach>  	           
        </optgroup>         
    </select>
    
    <label>Comune :</label> 

    <select name="id_comune"> 
        <optgroup label ="Comune">         
             <c:forEach var="j" items="${requestScope.comuni}">	            				
	              <option value="${j.id_comune}">${j.nome_comune}</option>	              
	         </c:forEach>  	           
        </optgroup>         
    </select>
    
    <br><br>
    
    <label>Descrizione Evento :</label> 
    <br>
    <input type="text" name="descrizione">
    
    <br><br>
    
    <label>link evento :</label> 
    <input type="text" name="urlEvento">
    
    <label>link immagine evento :</label> 
    <input type="text" name="urlImg">
    
    <br><br>
    
    <input type="submit">
    
    </form>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

</body>
</html>