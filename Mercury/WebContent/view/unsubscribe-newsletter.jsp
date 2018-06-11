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
            <h3 class="scrittabianca">Seleziona la tua mail !</h3> 
            <% } %>

			<br>
			<br>
		</div>
	</center>

	<div align="center" class="row sticky-top banner01"
		style="overflow: auto; padding: 10px; margin: 0px; min-width: 100%; max-width: 100%; background-color: rgba(128, 0, 0, 0.4);">

        <center>
        <h6 class="scrittabianca">Disiscrivendoti alla newsletter , non riceverai più alcun aggiornamento</h6> 
        </center>
        </div>
			   

		<div id="contenuto">
			<div id="box" class="border-radius">
			<center>
				<h1>Procedi con la disiscrizione</h1>
				<br>
					
						<h2 style="text-align: center">Digita la tua email e conferma</h2>

						<form method="get" action="../ControllerNewsletter">
							<input type="hidden" name="n" value="8"> <input
								type="text" name="email" value="Inserisci la tua email"
								size="25" onfocus="this.value =''"> <input type="submit"
									value="Disiscriviti"> <%String s = (String) session.getAttribute("stampa");%> 
									    <%
											if (s != null) {
												out.println("<h3 style='text-align: center'><font color='red'>" + s + "</font></h3>");
												s = "";
											}
										%>
						</form>
						
					</center>
			</div>
	

	<br>
	<br>

        
</body>
</html>