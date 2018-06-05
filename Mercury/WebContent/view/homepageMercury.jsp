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
<link rel="stylesheet" type="text/css" href="../css/homepageStile.css">
</head>
<body>
	<script>
	
		
		function dataEccessivainizio() {
			var ini = document.getElementById("inizio").value;
			var fin = document.getElementById("fine").value;

			if (fin < ini) {
				document.getElementById("inizio").style.backgroundColor = "red";
			} else {
				document.getElementById("inizio").style.backgroundColor = "white";
			}
		}
		
		function dataEccessivafine() {
			var ini = document.getElementById("inizio").value;
			var fin = document.getElementById("fine").value;

			if (fin < ini) {
				document.getElementById("fine").style.backgroundColor = "red";
			} else {
				document.getElementById("fine").style.backgroundColor = "white";
			}
		}
		
		
		
		
var xxx=1;
		$(document).ready(function() {
			
			   $("#cambiavedi").click(function(){
				   if(xxx==1)
				   {
					   xxx=2;
			        $("#vediLargo").hide("slow", function(){
			        	 $("#vediStretto").show(1000);
			        });
			        }
				   else{xxx=1;
					   $("#vediStretto").hide("slow", function(){
				        	 $("#vediLargo").show(1000);
				        });
					   
				   }
			    });
	
	
		
			

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

			$("#regSELEZIONATO").change(function() {
				var ric = "&categoria=";
				ric = ric + document.getElementById("catSELEZIONATO").value;
				ric = ric + "&regione=";
				ric = ric + document.getElementById("regSELEZIONATO").value;
				ric = ric + "&dataInizio=";
				ric = ric + document.getElementById("inizio").value;
				ric = ric + "&dataFine=";
				ric = ric + document.getElementById("fine").value;
				var xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {
						location.reload();
					}
				};
				var reg = "../ControllerHomepage?da=2" + ric;
				xhttp.open("GET", reg, true);
				xhttp.send();
			});

			$("#proSELEZIONATO").change(function() {

				var ric = "&categoria=";
				ric = ric + document.getElementById("catSELEZIONATO").value;
				ric = ric + "&regione=";
				ric = ric + document.getElementById("regSELEZIONATO").value;
				ric = ric + "&provincia=";
				ric = ric + document.getElementById("proSELEZIONATO").value;
				ric = ric + "&dataInizio=";
				ric = ric + document.getElementById("inizio").value;
				ric = ric + "&dataFine=";
				ric = ric + document.getElementById("fine").value;

				var xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {

						location.reload();

					}
					;
				}
				var pro = "../ControllerHomepage?da=3" + ric;
				xhttp.open("GET", pro, true);
				xhttp.send();
			});

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
		<h3 id="stampah3" style="color: #f54b03;">Gli eventi in Italia
			che aspettano solo il tuo click</h3>
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
			src="../images/search-icon2.png" /></a>
		<div class="col">
			<a href="#catAPRI" data-toggle="collapse" class="linkAPRIricerca">
				Categoria </a>
			<div id="catAPRI" class="collapse">
				<%
					try {
						x = conn.createStatement();
						rs = x.executeQuery("select nome_categoria from categorie order by nome_categoria ASC");
						
						String cat1 = (String) session.getAttribute("cate");
						out.print("<select id= 'catSELEZIONATO'>");
						if (cat1 == null) {
							out.print("<option id='primoCat' value='null'> seleziona </option> ");
						}
						else {
							if (cat1.equals("null")) {
								out.print("<option id='primoCat' value='" + cat1 + "'> seleziona </option> ");
							}
							else {
								out.print("<option id='primoCat' value='" + cat1 + "'>" + cat1 + "</option> ");
								out.print("<option id='primoCat' value='null'> -------- </option> ");
							}
						}
						
						while (rs.next()) {
							out.print("<option value='" + rs.getString("nome_categoria") + "'>");
							out.print(rs.getString("nome_categoria"));
							out.print("</option>");
						}
						out.print("</select>");
					}
					catch (Exception e) {
						out.println("wrong entry" + e);
					}
				%>
			</div>
		</div>
		<div class="col">
			<a href="#regAPRI" data-toggle="collapse" class="linkAPRIricerca">
				Regione </a>
			<div id="regAPRI" class="collapse">
				<%
					try {
						x = conn.createStatement();
						rs = x.executeQuery("select nome_regione from regioni order by nome_regione ASC; ");
						
						String reg1 = (String) session.getAttribute("regi");
						out.print("<select  id= 'regSELEZIONATO'>");
						if (reg1 == null) {
							out.print("<option id='primoReg'  value='null'> seleziona </option> ");
						}
						else {
							if (reg1.equals("null")) {
								out.print("<option id='primoReg' value='" + reg1 + "'> seleziona </option> ");
							}
							else {
								out.print("<option id='primoReg' value='" + reg1 + "'>" + reg1 + "</option> ");
								out.print("<option id='primoReg2'  value='null'> -------- </option> ");
								
							}
						}
						
						while (rs.next()) {
							out.print("<option value='" + rs.getString("nome_regione") + "'>");
							out.print(rs.getString("nome_regione"));
							out.print("</option>");
						}
						out.print("</select>");
					}
					catch (Exception e) {
						out.println("wrong entry" + e);
					}
				%>
			</div>
		</div>
		<div class="col">
			<a id="aProvincia" href="#proAPRI" data-toggle="collapse"
				class="linkAPRIricerca"> Provincia </a>
			<div id="proAPRI2" class="collapse"></div>
			<div id="proAPRI" class="collapse">
				<%
					try {
						x = conn.createStatement();
						String prov1;
						String reg2 = (String) session.getAttribute("regi");
						
						if (reg2 == null) {
							reg2 = "null";
						}
						
						if (reg2.equals("null")) {
							prov1 = "null";
						}
						else {
							prov1 = (String) session.getAttribute("prov");
						}
						
						rs = x.executeQuery(
						        "SELECT p.nome_provincia from province as p, regioni as r where p.id_regione=r.id_regione and r.nome_regione='"
						                + reg2 + "' order by nome_provincia ASC;");
				%>
				<select id='proSELEZIONATO'>
					<%
						if (prov1 == null) {
								out.print("<option id='primoPro'  value='null' > seleziona </option> ");//lista
							}
							else {
								if (prov1.equals("null")) {
									out.print("<option id='primoPro' value='" + prov1 + "'> seleziona  </option> ");//lista
								}
								else {
									out.print("<option id='primoPro' value='" + prov1 + "'>" + prov1 + "</option> ");
									out.print("<option id='primoPro2'  value='null'>--------</option> ");
									
								}
							}
							
							while (rs.next()) {
								out.print("<option value='" + rs.getString("nome_provincia") + "'>");
								out.print(rs.getString("nome_provincia"));
								out.print("</option>");
							}
							
							out.print("</select>");
						}
						catch (Exception e) {
							out.println("wrong entry" + e);
						}
					%>
				
			</div>
		</div>
		<div class="col">
			<a id="aComune" href="#comAPRI" data-toggle="collapse"
				class="linkAPRIricerca"> Comune </a>
			<div id="comAPRI" class="collapse">
				<select id="comSELEZIONATO">
					<option value="null" id='primoCom'>seleziona</option>
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
	</div>
<button style="margin-left:3%;"  type="button" class="btn btn-secondary" id="cambiavedi" >cambia visualizzazione</button>
	<div align="center" class="row" style="max-width: 100%; padding: 20px;">
	
		<div style="display:none;" id="vediStretto" class="col-sm-10">
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
						<tr onclick="document.location='<c:out value="${j.url_sito_evento}"></c:out>' ">
							<td>
							<img style="height: 40px; width: 40px;"	src="<c:out value='${j.url_img_evento }'></c:out>"></td>
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
		
		
		
		
		
		<div id="vediLargo" style="display:block;" class="col-sm-10">
			<table style="width:100%;">
				<c:forEach var="j" items="${sessionScope.risultatoRicerca}">
					<tr>
						<td class="bordini">
							<div class="card" class="bordini">
								<div class="card-body" class="bordini">
									<table style="width: 100%">
										<tr>
											<td style="width: 150px;"><img
												style="width: 150px; height: 150px; margin-right: 20px;"
												src="<c:out value='${j.url_img_evento }'></c:out>" /></td>
											<td style="float: left;">
												<h2 style="float: left;" class="card-title">
													<c:out value="${j.nome_evento }"></c:out>
												</h2>
											
												<br>
											<br><br>
												<p class="card-text">
													<c:out value="${j.descrizione }"></c:out>
												</p> <a href="<c:out value="${j.url_sito_evento}"></c:out>"
												class="card-link"> link evento</a> <a href="#"
												class="card-link">link ente</a>
											</td>
												
											<td style="right: 0px; text-align:right;">
											
											<h2 style="margin-left: 100px;" class="badge badge-primary">
													<c:out value="${j.nome_categoria }"></c:out>
												</h2><br><br>
											da <c:out value="${j.data_inizio }"></c:out>
										<br>a <c:out value="${j.data_fine }"></c:out><br><br>
												<h2 style="margin-left: 100px;" class="badge badge-danger">
													<c:out value="${j.nome_comune }"></c:out>
												</h2>
												
												</td>
										</tr>
									</table>
								</div>
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="col-sm-2"
			style="padding: 0px; border-left: 2px solid #f54b03;">
			<a style="display: block;" href="../ControllerNewsletter?n=0"><div
					id="box1" class="boxDestra">
					<h2>
						iscriviti <br> alla
					</h2>
				</div> </a> <a href="registraEnte.jsp"
				style="text-decoration: none; display: block;"><div id="box2"
					class="boxDestra">
					<h3>
						<br>vuoi pubblicare i tuoi eventi? <br> <br> <br>
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