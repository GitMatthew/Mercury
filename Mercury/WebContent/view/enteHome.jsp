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
    
    
    
    <label for=nomeEvento>Nome Evento</label> 
    <br>
    <input type="text" id="nomeEvento">
    
    <br><br>
    
    <label for=data>Periodo evento</label>
    <br>
    <label for=data>Dal :</label> 
    
    <select>
    <optgroup label ="Giorno">
    <option value=1>1</option>
    <option value=2>2</option>
    <option value=3>3</option>
    <option value=4>4</option>
    <option value=5>5</option>
    <option value=6>6</option>
    <option value=7>7</option>
    <option value=8>8</option>
    <option value=9>9</option>
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
       
    <select>
    <optgroup label ="Mese">
    <option value=1>gennaio</option>
    <option value=2>febbraio</option>
    <option value=3>marzo</option>
    <option value=4>aprile</option>
    <option value=5>maggio</option>
    <option value=6>giugno</option>
    <option value=7>luglio</option>
    <option value=8>agosto</option>
    <option value=9>settembre</option>
    <option value=10>ottobre</option>
    <option value=11>novembre</option>
    <option value=12>dicembre</option>
    </optgroup>   
    </select>
    
    <select>
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
    
    <label for=data>al :</label>  
    
    <select>
    <optgroup label ="Giorno">
    <option value=1>1</option>
    <option value=2>2</option>
    <option value=3>3</option>
    <option value=4>4</option>
    <option value=5>5</option>
    <option value=6>6</option>
    <option value=7>7</option>
    <option value=8>8</option>
    <option value=9>9</option>
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
       
    <select>
    <optgroup label ="Mese">
    <option value=1>gennaio</option>
    <option value=2>febbraio</option>
    <option value=3>marzo</option>
    <option value=4>aprile</option>
    <option value=5>maggio</option>
    <option value=6>giugno</option>
    <option value=7>luglio</option>
    <option value=8>agosto</option>
    <option value=9>settembre</option>
    <option value=10>ottobre</option>
    <option value=11>novembre</option>
    <option value=12>dicembre</option>
    </optgroup>   
    </select>
    
    <select>
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
    
    <label for=address>Indirizzo</label> 
    <br>
    <input type="text" id="address">
    
    <br><br>
      
    <label for=categoria>Selezione tipologia di Evento</label> 
    <br> 
    <select> 
        <optgroup label ="Categoria">         
             <c:forEach var="j" items="${requestScope.categorie}">	            				
	              <option value="${j.id_categoria}">${j.nome_categoria}</option>	              
	         </c:forEach>  	           
        </optgroup>         
    </select>
    
    <br><br>
    
    <label for=regione>Regione :</label> 
     
    <select> 
        <optgroup label ="Regione">         
             <c:forEach var="j" items="${requestScope.regioni}">	            				
	              <option value="${j.id_regione}">${j.nome_regione}</option>	              
	         </c:forEach>  	           
        </optgroup>         
    </select> 
    
    <label for=regione>Provincia :</label> 
    <select> 
        <optgroup label ="Regione">         
             <c:forEach var="j" items="${requestScope.regioni}">	            				
	              <option value="${j.id_regione}">${j.nome_regione}</option>	              
	         </c:forEach>  	           
        </optgroup>         
    </select>
    
    <label for=regione>Comune :</label> 

    <select> 
        <optgroup label ="Regione">         
             <c:forEach var="j" items="${requestScope.regioni}">	            				
	              <option value="${j.id_regione}">${j.nome_regione}</option>	              
	         </c:forEach>  	           
        </optgroup>         
    </select>
    
    <br><br>
    
    <label for=descrizione>Descrizione Evento :</label> 
    <br>
    <input type="text" id="descrizione">
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

</body>
</html>