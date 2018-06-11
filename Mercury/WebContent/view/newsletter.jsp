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
<link rel="stylesheet" type="text/css"
	href="/Mercury_Mercury/css/homepageStile.css">
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark noSpace"
		style="background-color:black !important;"> <a
		class="navbar-brand noSpace" href="../ControllerHomepage?da=0"><img
		class="noSpace" style="width: 150px; height: 60px;"
		src="../images/logo.jpg"> </a>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active spaziaLato"><a class="nav-link"
				href="../ControllerHomepage?da=0">HOME</a></li>
			<li class="nav-item spaziaLato">
				<%
			
			if(session.getAttribute("user")==null){
				
				out.print("<a href='#entiAPRI'	data-toggle='collapse' class='nav-link'>AREA ENTI</a></li>");
			}else{
				
				out.print("<a href='../ControllerEnte?pag=1'  class='nav-link'>TORNA AREA ENTE</a></li>");
			}
		%>

				<div id="entiAPRI" class="collapse">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item active spaziaLato"><a class="nav-link"
							href="loginEnte.jsp">LOGIN</a></li>
						<li class="nav-item active spaziaLato"><a class="nav-link"
							href="registraEnte.jsp">REGISTRATI</a></li>
					</ul>
				</div>
		</ul>
	</div>
	</nav>



	<%
		Connection conn = null;
		conn = Dao.getConnection();
		Statement x = null;
		ResultSet rs = null;
	%>

	<center>
		<div class="banner01">
			<br><br>


			<h1 class="scrittabianca">ISCRIZIONE ALLA NEWSLETTER</h1>
			<% if(request.getAttribute("messaggio")!=null) { %>   	
            <h3 class="scrittabianca"><%=request.getAttribute("messaggio")%></h3>	
            <% } else {	%>	
            <h3 class="scrittabianca">Seleziona almeno un luogo per iscriverti !</h3> 
            <% } %>

			<br>
			<br>
		</div>
	</center>
	
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
															$('#id_provincia').append('<option value=0>seleziona</option>');
															$('#id_comune').append('<option value=0>seleziona</option>');
															
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
															$('#id_comune').append('<option value=0>seleziona</option>');
												
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

	<div align="center" class="row sticky-top banner01"
		style="overflow: auto; padding: 10px; margin: 0px; min-width: 100%; max-width: 100%; background-color: rgba(128, 0, 0, 0.4);">

        
        <c:if test="${requestScope.news != 2 }">
        <form method="get" action="../ControllerNewsletter">	
	<input type="hidden" name="n" value="5">
	   	   
	   	   
	   	    <label><b><i>Regione :</i></b></label>    
			<select id='id_regione' name="id_regione">
			        <option value=0>seleziona</option>
					<c:forEach var="j" items="${sessionScope.reg22}">
						<option value="<c:out value="${j.id_regione}"></c:out>">
							<c:out value="${j.nome_regione}"></c:out>
						</option>
					</c:forEach>

			</select>		
			
			<label><b><i>Provincia :</i></b></label>  
			<select id="id_provincia" name="id_provincia">
            <option value=0>seleziona</option>
			</select>
			
            <label><b><i>Comune :</i></b></label>           
			<select id="id_comune" name="id_comune">
            <option value=0>seleziona</option>
			</select>
			   

		<input type="submit" value="Aggiungi Luogo" >
		
		
				
		</form>	
		</c:if>
		
		</div>
		
	
					
		<div>
        
		<form method="get" action="../ControllerNewsletter">			
	
        
       
        
		<c:choose>
			<c:when test="${sessionScope.luoghi.size()>0}">
				<h2>Lista iscrizione luoghi della Newsletter :</h2>
								<c:forEach items="${sessionScope.luoghi}" var="current">
					<p style="color: red; display: inline;">
						<c:out value="Luogo:"></c:out>
					</p>
					<p style="display: inline;">
						<c:out
							value="${current.regione.nome_regione} ${current.provincia.nome_provincia} ${current.comune.nome_comune}" />
					</p>
					<hr>
				</c:forEach>
				<p>
				     <input type="hidden" name="n" value="6"> <input type="submit"
				         name="luogo" value="Rimuovi tutti i Luoghi"
				         style="float: left; margin: 10px;">
				
						<% request.setAttribute("news" , 2 ); %>
				</p>
			</c:when>
		</c:choose>
		
		
		
				</form>
				
				
			<br>
	        <br>
	        <br>
	        <br>
			
			
		
			<c:if test="${requestScope.news == 2 }"> 
			<h2>Concludi l'iscrizione alla Newsletter:</h2>
				<div style="text-align: left; padding: 10px">
					<form method="get" action="../ControllerNewsletter">
						<input type="hidden" name="n" value="7">
							<p style="color: red; font-weight: bold;">${sessionScope.messaggio}</p>
							<input type="hidden" name="n" value="7">
							<p style="color: green; font-weight: bold;">${sessionScope.messaggio2}</p>
							<p style="display: inline;">Inserisci la tua email:</p> <input
							type="text" name="mail" size="25"> 
								<p style="display: inline;">Seleziona la cadenza:</p> <select
								name="cadenza" style="margin: 10px">
									<c:forEach var="j" items="${sessionScope.cadenze}">
										<option value="${j.id_cadenza}"><c:out
												value="${j.nome_cadenza }"></c:out></option>
									</c:forEach>
							</select>
								<p>Seleziona le categorie di interesse:</p>
								<fieldset style="border: none;">
									<c:forEach var="j" items="${sessionScope.categorie}">
										<c:if test="${j.id_categoria!=1}">
											<input name="categorie" value="${j.id_categoria}"
												type="checkbox" style="margin: 5px">
												${j.nome_categoria }
										</c:if>
									</c:forEach>
								</fieldset> <input type="submit" name="submit"
								value="Iscriviti alla Newsletter"
								style="float: left; margin: 10px;">
					</form>
					</c:if>
					<br></br>
 
	</div>
	

	<br>
	<br>

        
</body>
</html>