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
 <meta http-equiv="Pragma" content="no-cache">
 <meta http-equiv="Cache-Control" content="no-cache">
 <meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">
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
<body>
	<script>


	
	
		$(document).ready(function() {
			
			
			

			$("#linkGETricerca").click(function() {

				var ric = "&categoria=";
				ric = ric + document.getElementById("catSELEZIONATO").value;
				ric = ric + "&regione=";
				ric = ric + document.getElementById("regSELEZIONATO").value;
				ric = ric + "&provincia=";
				ric = ric + document.getElementById("proSELEZIONATO").value;
				ric = ric + "&comune=";
				ric = ric + document.getElementById("comSELEZIONATO").value;
				ric = ric + "&dataInizio=";
				ric = ric + document.getElementById("inizio").value;
				ric = ric + "&dataFine=";
				ric = ric + document.getElementById("fine").value;
				$("#linkGETricerca").attr("href", function(i, origValue) {
					return origValue + ric;
				});
			});
		
	
	$("#regSELEZIONATO").change(function() 
				{  var xReg = document.getElementById("regSELEZIONATO").value;
		    		var xhttp = new XMLHttpRequest();
		    		xhttp.onreadystatechange = function() 
		    			{
		        		if (this.readyState == 4 && this.status == 200 /*(this.status == 200 || this.status == 302 || this.status == 401)*/) 
		        			{ 	/*location.reload();*/ } };
		    var reg = "../ControllerHomepage?da=2&regione="+ xReg;
		    xhttp.open("GET", reg , true); 
		    xhttp.send(); 
		});
  
    
		$("#proSELEZIONATO").change(function() {	
			    var xhttp = new XMLHttpRequest();
			    xhttp.onreadystatechange = function() {     
			    	if (this.readyState == 4 && this.status == 200) {	/*location.reload();*/ };
			    }
			    var pro = "../ControllerHomepage?da=3&provincia="+document.getElementById("proSELEZIONATO").value;
			    xhttp.open("GET", pro , true); 
			    xhttp.send(); 
		});

		
		/*	$.ajax({
				 
			    // The URL for the request
			    url: "post.php",
			 
			    // The data to send (will be converted to a query string)
			    data: {
			        id: 123
			    },
			 
			    // Whether this is a POST or GET request
			    type: "GET",
			 
			    // The type of data we expect back
			    dataType : "json",
			})
			 
			*/
		
		
		
	/*	$(function worker(){
		    // don't cache ajax or content won't be fresh
		   $.ajaxSetup ({
		        cache: false,
		        complete: function() {
		          // Schedule the next request when the current one's complete
		          setTimeout(worker, 3000);
		        }
		    });
		    var ajax_load = "<select  id='proSELEZIONATO'>	<option  value='null' id='primoPro' >seleziona</option>		<c:forEach var='j' items='${sessionScope.dammiPro}'>			<option><c:out value='${j}'>${j}</c:out></option>			</c:forEach>			</select> "  ;		    
		    // load() functions
		 	
		    	var ric = "../ControllerHomepage?da=0&categoria=";
			ric = ric + document.getElementById("catSELEZIONATO").value;
			ric = ric + "&regione=";
			ric = ric + document.getElementById("regSELEZIONATO").value;
			ric = ric + "&provincia=";
			ric = ric + document.getElementById("proSELEZIONATO").value;
			ric = ric + "&comune=";
			ric = ric + document.getElementById("comSELEZIONATO").value;
			ric = ric + "&dataInizio=";
			ric = ric + document.getElementById("inizio").value;
			ric = ric + "&dataFine=";
			ric = ric + document.getElementById("fine").value;
		    var loadUrl = ric ;
		    $("#proAPRI").style.display="none" ;
		    $("#proAPRI2").html(ajax_load).load(loadUrl);

		// end  
		});*/
	

		});
		</script>
	
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark noSpace">
	<a class="navbar-brand noSpace" href="../ControllerHomepage?da=0"><img
		class="noSpace" style="width: 150px; height: 60px;"
		src="../images/logo.jpg"> </a>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active spaziaLato"><a class="nav-link"
				href="../ControllerHomepage?da=0">HOME</a></li>
			<li class="nav-item spaziaLato"><a href="#entiAPRI"
				data-toggle="collapse" class="nav-link ">AREA ENTI</a></li>
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
	<div class="jumbotron text-center"
		style="margin: 0px; padding: 0px 30px 10px 30px; color: white; background-image: url('../images/sfondo3.jpg'); background-repeat: no-repeat; background-position: center; background-size: cover;">
		<h1 style="color: #f54b03;">MERCURY EVENTS</h1>
		<br>
		<h3 id="stampah3" style="color: #f54b03;">Gli eventi in Italia che aspettano
			solo il tuo click</h3>
		<br>
		<h2 style="color: #f54b03;">
			cerca tutti gli eventi italiani scegliendo la categoria che
			preferisci, i luoghi che ami, <br> o i giorni che ti stanno piu'
			comodi
		</h2>
	</div>
	<%
		Connection conn = null;
		conn = Dao.getConnection();
		Statement x = null;
		ResultSet rs = null;
	%>
	<div align="center" class="row sticky-top"
		style="overflow: auto; padding: 10px; margin: 0px; min-width: 100%; max-width: 100%; background-color: rgba(128, 0, 0, 0.4);">
		<a id="linkGETricerca" href="../ControllerHomepage?da=1"><img
			style="padding-left: 5px; height: 40px;"
			src="../images/search-icon.png" /></a>
		<div class="col">
			<a href="#catAPRI" data-toggle="collapse" class="linkAPRIricerca">
				Categoria </a>
			<div id="catAPRI" class="collapse">
				<%
					try {
						x = conn.createStatement();
						rs = x.executeQuery("select nome_categoria from categorie order by nome_categoria ASC");

						out.print("<select id= 'catSELEZIONATO'>");
						out.print("<option id='primoCat' value='null'> seleziona </option> ");
						while (rs.next()) {
							out.print("<option value='" + rs.getString("nome_categoria") + "'>");
							out.print(rs.getString("nome_categoria"));
							out.print("</option>");
						}
						out.print("</select>");
					} catch (Exception e) {
						out.println("wrong entry" + e);
					}
				%>
			</div>
		</div>
		<div class="col">
			<a href="#regAPRI" data-toggle="collapse" class="linkAPRIricerca" >
				Regione </a>
			<div id="regAPRI" class="collapse"  >
			
			  
			
				<%
					try {
						x = conn.createStatement();
						rs = x.executeQuery("select nome_regione from regioni ");

						out.print("<select  onchange='daje()' id= 'regSELEZIONATO'>");
						out.print("<option id='primoReg'  value='null'> seleziona </option> ");
						while (rs.next()) {
							out.print("<option value='" + rs.getString("nome_regione") + "'>");
							out.print(rs.getString("nome_regione"));
							out.print("</option>");
						}
						out.print("</select>");
					} catch (Exception e) {
						out.println("wrong entry" + e);
					}
				%>
			</div>
		</div>
		<div class="col">
			<a id="aProvincia" href="#proAPRI"  data-toggle="collapse" class="linkAPRIricerca">
				Provincia </a>
					<div id="proAPRI2" class="collapse"> </div>
			<div id="proAPRI" class="collapse">

				<select  id="proSELEZIONATO">
				<option  value="null" id='primoPro' >seleziona</option>
				<c:forEach var="j" items="${sessionScope.dammiPro}">
						<option><c:out value="${j}">${j}</c:out></option>
					</c:forEach>
				</select>
				
			</div>
		</div>
		<div class="col" >
			<a id="aComune" href="#comAPRI" data-toggle="collapse" class="linkAPRIricerca">
				Comune </a>
			<div id="comAPRI" class="collapse">
					<select  id="comSELEZIONATO" >
				<option  value="null" id='primoCom' >seleziona</option>
				<c:forEach var="K" items="${sessionScope.dammiCom}">
						<option><c:out value="${K}">${K}</c:out></option>
					</c:forEach>
				</select>
				
			</div>
		 
		</div>
		<div class="col">
			<input type="date" id="inizio" class="form-control"
				onchange="myFunction()" style="max-width: 100%;">
		</div>
		<div class="col">
			<input type="date" id="fine" onchange="dataEccessiva()"
				class="form-control" style="max-width: 100%;">
		</div>
		<script>
			function dataEccessiva() {
				var ini = document.getElementById("inizio").value;
				var fin = document.getElementById("fine").value;

				if (fin < ini) {
					document.getElementById("fine").style.backgroundColor = "red";
				} 
				else 
				{
					document.getElementById("fine").style.backgroundColor = "white";
				}
			}
		</script>
	</div>
	<br>
	<br>
	<div align="center" class="row" style="max-width: 100%; padding: 20px;">
		<div class="col-sm-10">
			<table class="table table-dark table-hover">
				<thead>
					<tr>
						<th>img</th>
						<th>titolo</th>
						<th>categoria</th>
						<th>descrizione</th>
						<th>comune</th>
						<th class="tabDATA">dataInizio</th>
						<th class="tabDATA">dataFine</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="j" items="${sessionScope.risultatoRicerca}">
						<tr data-href="<c:out value="${j.url_sito_evento}"></c:out>">
							<td><img style="height: 40px; width: 40px;"
								src="<c:out value="${j.url_img_evento }"></c:out>"></td>
							<td><c:out value="${j.nome_evento }"></c:out></td>
							<td><c:out value="${j.nome_categoria }"></c:out></td>
							<td><c:out value="${j.descrizione }"></c:out></td>
							<td><c:out value="${j.nome_comune}"></c:out></td>
							<td><c:out value="${j.data_inizio }"></c:out></td>
							<td><c:out value="${j.data_fine }"></c:out></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-sm-2"
			style="padding: 0px; border-left: 2px solid #f54b03;">
			<a style="display:block;" href="../ControllerNewsletter?n=0" ><div id="box1" class="boxDestra">
				<h2>
					iscriviti <br> alla
				</h2>
			</div> </a>
			<a   href="registraEnte.jsp" style="text-decoration: none; display:block;"><div
					id="box2" class="boxDestra">
					<h3>
						<br>vuoi pubblicare i tuoi eventi? <br>
						<br>
						<br>
						<br> diventa ente Mercury
					</h3>
				</div></a>
			<div id="box3" class="boxDestra"></div>
			<div id="box4" class="boxDestra"></div>
		</div>
	</div>
	<br>
	<br>
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>Footer</p>
	</div>
	<br>
	<br>
</body>
</html>