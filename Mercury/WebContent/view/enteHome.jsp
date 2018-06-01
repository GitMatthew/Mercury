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
    
    <select name="giornoInizio">
    <optgroup label ="Giorno">
    <option value=01>1</option>
    <option value=02>2</option>
    <option value=03>3</option>
    <option value=04>4</option>
    <option value=05>5</option>
    <option value=06>6</option>
    <option value=07>7</option>
    <option value=08>8</option>
    <option value=09>9</option>
    <option value=10>10</option>
    <option value=11>11</option>
    <option value=12>12</option>
    <option value=13>13</option>
    <option value=14>14</option>
    <option value=15>15</option>
    <option value=16>16</option>
    <option value=17>17</option>
    <option value=18>18</option>
    <option value=19>19</option>
    <option value=20>20</option>
    <option value=21>21</option>
    <option value=22>22</option>
    <option value=23>23</option>
    <option value=24>24</option>
    <option value=25>25</option>
    <option value=26>26</option>
    <option value=27>27</option>
    <option value=28>28</option>
    <option value=29>29</option>
    <option value=30>30</option>
    <option value=31>31</option>
    </optgroup>   
    </select>
       
    <select name="meseInizio">
    <optgroup label ="Mese">
    <option value=01>gennaio</option>
    <option value=02>febbraio</option>
    <option value=03>marzo</option>
    <option value=04>aprile</option>
    <option value=05>maggio</option>
    <option value=06>giugno</option>
    <option value=07>luglio</option>
    <option value=08>agosto</option>
    <option value=09>settembre</option>
    <option value=10>ottobre</option>
    <option value=11>novembre</option>
    <option value=12>dicembre</option>
    </optgroup>   
    </select>
    
    <select name="annoInizio">
    <optgroup label ="Anno">
    <option value=2018>2018</option>
    <option value=2019>2019</option>
    <option value=2020>2020</option>
    <option value=2021>2021</option>
    <option value=2022>2022</option>
    <option value=2023>2023</option>
    <option value=2024>2024</option>
    <option value=2025>2025</option>
    <option value=2026>2026</option>
    </optgroup>   
    </select>
    
    <label>al :</label>  
    
    <select name="giornoFine">
    <optgroup label ="Giorno">
    <option value=01>1</option>
    <option value=02>2</option>
    <option value=03>3</option>
    <option value=04>4</option>
    <option value=05>5</option>
    <option value=06>6</option>
    <option value=07>7</option>
    <option value=08>8</option>
    <option value=09>9</option>
    <option value=10>10</option>
    <option value=11>11</option>
    <option value=12>12</option>
    <option value=13>13</option>
    <option value=14>14</option>
    <option value=15>15</option>
    <option value=16>16</option>
    <option value=17>17</option>
    <option value=18>18</option>
    <option value=19>19</option>
    <option value=20>20</option>
    <option value=21>21</option>
    <option value=22>22</option>
    <option value=23>23</option>
    <option value=24>24</option>
    <option value=25>25</option>
    <option value=26>26</option>
    <option value=27>27</option>
    <option value=28>28</option>
    <option value=29>29</option>
    <option value=30>30</option>
    <option value=31>31</option>
    </optgroup>   
    </select>
       
    <select name="meseFine">
    <optgroup label ="Mese">
    <option value=01>gennaio</option>
    <option value=02>febbraio</option>
    <option value=03>marzo</option>
    <option value=04>aprile</option>
    <option value=05>maggio</option>
    <option value=06>giugno</option>
    <option value=07>luglio</option>
    <option value=08>agosto</option>
    <option value=09>settembre</option>
    <option value=10>ottobre</option>
    <option value=11>novembre</option>
    <option value=12>dicembre</option> 
    </optgroup>   
    </select>
    
    <select name="annoFine">
    <optgroup label ="Anno">
    <option value=2018>2018</option>
    <option value=2019>2019</option>
    <option value=2020>2020</option>
    <option value=2021>2021</option>
    <option value=2022>2022</option>
    <option value=2023>2023</option>
    <option value=2024>2024</option>
    <option value=2025>2025</option>
    <option value=2026>2026</option>
    </optgroup>   
    </select>
    
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
        <optgroup label ="Regione">         
             <c:forEach var="j" items="${requestScope.regioni}">	            				
	              <option value="${j.id_regione}">${j.nome_regione}</option>	              
	         </c:forEach>  	           
        </optgroup>         
    </select>
    
    <label>Comune :</label> 

    <select name="id_comune"> 
        <optgroup label ="Regione">         
             <c:forEach var="j" items="${requestScope.regioni}">	            				
	              <option value="${j.id_regione}">${j.nome_regione}</option>	              
	         </c:forEach>  	           
        </optgroup>         
    </select>
    
    <br><br>
    
    <label>Descrizione Evento :</label> 
    <br>
    <input type="text" name="descrizione">
    
    <br><br>
    
    <input type="submit">
    
    </form>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

</body>
</html>