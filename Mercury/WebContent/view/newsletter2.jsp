<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import="com.corso.dao.Dao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mercury Events</title>
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
		var xxx = 1;
		$(document)
				.ready(
						function() {

							$("#cambiavedi").click(function() {
								if (xxx == 1) {
									xxx = 2;
									$("#vediLargo").hide(1000, function() {
										$("#vediStretto").show(1000);
									});
								} else {
									xxx = 1;
									$("#vediStretto").hide(1000, function() {
										$("#vediLargo").show(1000);
									});

								}
							});
							$("#linkGETricerca").click(function() {

												var ric = "&categoria=";
												ric = ric+ document.getElementById("catSELEZIONATO").value;
												ric = ric + "&regione=";
												ric = ric+ document.getElementById("regSELEZIONATO").value;
												ric = ric + "&provincia=";
												ric = ric+ document.getElementById("pro11").value;
												ric = ric + "&comune=";
												ric = ric+ document.getElementById("com11").value;
												ric = ric + "&dataInizio=";
												ric = ric+ document.getElementById("inizio").value;
												ric = ric + "&dataFine=";
												ric = ric+ document.getElementById("fine").value;
												$("#linkGETricerca").attr("href",function(i, origValue) {
															return origValue+ ric;
														});

											});

							$("#regSELEZIONATO").change(function() {$.ajax({type : 'POST',
														data : {regione : $("#regSELEZIONATO").val(),dap : "0"},
														url : '../ControllerHomepage',
														success : function(result) {
																var vPro = [];
																vPro.push(result);
																var json = JSON.parse(result);
																$('#pro11').empty();
																$('#com11').empty();
																$('#pro11').append('<option value="null">seleziona</option>');
																$('#com11').append('<option value="null">seleziona</option>');
																for ( var i in json.pro22) {
																	$('#pro11').append('<option value="'+json.pro22[i]+'">'+ json.pro22[i]+ '</option>')
																}
															}
														});

											});

							$("#pro11").change(function() {$.ajax({
															type : 'POST',
															data : {provincia : $("#pro11").val(),dap : "1"},
															url : '../ControllerHomepage',
															success : function(result) {
																var vCom = [];
																vCom.push(result);
																var json = JSON.parse(result);
																$('#com11').empty();
																$('#com11').append('<option value="null">seleziona</option>');
																for ( var i in json.com22) {
																	$('#com11').append('<option value="'+json.com22[i]+'">'+ json.com22[i]+ '</option>')
																}
															}
														});

											});

							$("#inputRicerca1").on("keyup",function() {
												var value = $(this).val().toLowerCase();
												$("#tabellaStretta tr").filter(function() {
																	$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
																});
												$("#tabellaLarga tr").filter(function() {
																	$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
																});

											});

						});
	</script>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark noSpace"
		style="background-color:black !important;"> <a
		class="navbar-brand noSpace" href="../ControllerHomepage?da=0"><img
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
						/*
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
						*/
						out.print("<select id= 'catSELEZIONATO'>");
						out.print("<option id='primoCat' value='null'> seleziona </option> ");
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
						/*
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
						*/
						out.print("<select  id= 'regSELEZIONATO'>");
						out.print("<option id='primoReg'  value='null'> seleziona </option> ");
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
				<select id="pro11">
					<option value="null">seleziona</option>
				</select>
			</div>
		</div>
		<div class="col">
			<a id="aComune" href="#comAPRI" data-toggle="collapse"
				class="linkAPRIricerca"> Comune </a>
			<div id="comAPRI" class="collapse">
				<select id="com11">
					<option value="null">seleziona</option>
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
	<div align="center" class="row" style="max-width: 100%; padding: 30px;">
		
		<div class="col-sm-2"></div>
		<div class="col-sm-6">
			<input class="form-control" id="inputRicerca1" type="text"
				placeholder="Cerca evento..">
		</div>
		<div class="col-sm-2"></div>
	</div>
	<div align="center" class="row" style="max-width: 100%; padding: 20px;">
		<div style="display: none;" id="vediStretto" class="col-sm-10">
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
				<tbody id="tabellaStretta">
					<c:forEach var="j" items="${sessionScope.risultatoRicerca}">
						<tr
							onclick="document.location='<c:out value="${j.url_sito_evento}"></c:out>' ">
							<td><img style="height: 40px; width: 40px;"
								src="<c:out value='${j.url_img_evento }'></c:out>"></td>
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
		<div id="vediLargo" style="display: block;" class="col-sm-10">
		
		
			<table style="width: 100%;">
			
			<h1>Concludi l'iscrizione alla Newsletter...</h1>
				<div style="text-align: left; padding: 10px">
					<form method="get" action="../ControllerNewsletter">
						<input type="hidden" name="n" value="7">
							<p style="color: red; font-weight: bold;">${sessionScope.messaggio}</p>
							<p style="display: inline;">Inserisci la tua email:</p> <input
							type="text" name="mail" size="25"> <br></br>
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
												${j.nome_categoria }<br></br>
										</c:if>
									</c:forEach>
								</fieldset> <input type="submit" name="submit"
								value="Iscriviti alla Newsletter"
								style="float: left; margin: 10px;">
					</form>
					<br></br>
					<p style="">
						<a href="../view/newsletter.jsp">Torna indietro...</a>
					</p>
				<c:forEach var="j" items="${sessionScope.risultatoRicerca}">
					<tr>
						<td class="bordini">
							<div class="card" class="bordini">
								<div class="card-body" class="bordini">
									<table style="width: 100%" id="tabellaLarga">
										<tr>
											<td style="width: 150px;"><img
												style="width: 150px; height: 150px; margin-right: 20px;"
												src="<c:out value='${j.url_img_evento }'></c:out>" /></td>
											<td style="float: left;">
												<h2 style="float: left;" class="card-title">
													<c:out value="${j.nome_evento }"></c:out>
												</h2> <br> <br>
											<br>
												<p class="card-text">
													<c:out value="${j.descrizione }"></c:out>
												</p> <a href="<c:out value="${j.url_sito_evento}"></c:out>"
												class="card-link"> link evento</a> <a href="#"
												class="card-link">link ente</a>
											</td>
											<td style="right: 0px; text-align: right;">
												<h3>
													<span style="margin-left: 100px;"
														class="badge badge-primary"> <c:out
															value="${j.nome_categoria }"></c:out>
													</span>
												</h3>
												<div style="padding: 10px;">
												 da <c:out value="${j.data_inizio }"></c:out> <br>a
												<c:out value="${j.data_fine }"></c:out><br>
												</div>
												
												<h3><span style="margin-left:100px;"
														class="badge badge-danger"> <c:out
															value="${j.nome_comune }"></c:out>
													</span></h3>
													
												
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
						iscriviti <br> alla <br> Newsletter
					</h2>
				</div> </a> 
			<a href="registraEnte.jsp"
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