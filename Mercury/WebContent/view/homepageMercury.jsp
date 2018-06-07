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

		
	if(!((fin=="")||(ini=="")))
			if (fin < ini) {
				document.getElementById("inizio").style.border  = " 2px solid red";
			} else {
				document.getElementById("inizio").style.border  = " 0px solid red";
			}
		}

		function dataEccessivafine() {
			var ini = document.getElementById("inizio").value;
			var fin = document.getElementById("fine").value;

			if (fin < ini) {
				document.getElementById("fine").style.border  = " 2px solid red";
			} else {
				document.getElementById("fine").style.border  = " 0px solid red";
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

							$("#regSELEZIONATO").change(function() {
								
								
								$.ajax({type : 'POST',
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
																
																var x1 =0;
																var x2 = 0;
																for ( var i in json.pro22) {
																	x2 =0 ;
																	for ( var j in json.pro23) {
																		if(x2==x1){
																			$('#pro11').append('<option value="'+json.pro22[i]+'">'+ json.pro23[j]+ '</option>');
																			
																		}
																	
																		x2=x2+1;
																	}
																x1 = x1+1 ;
																	}
																
															
														}
														
								  			});

											});

							$("#pro11").change(function() {
							
								$.ajax({
															type : 'POST',
															data : {provincia : $("#pro11").val(),dap : "1"},
															url : '../ControllerHomepage',
															success : function(result) {
																
																
																var vCom = [];
																vCom.push(result);
																var json = JSON.parse(result);
																$('#com11').empty();
																$('#com11').append('<option value="null">seleziona</option>');
													
																var x1 =0;
																var x2 = 0;
																for ( var i in json.com22) {
																	x2 =0 ;
																	for ( var j in json.com23) {
																		if(x2==x1){
																			$('#com11').append('<option value="'+json.com22[i]+'">'+ json.com23[j]+ '</option>');
																			
																		}
																	
																		x2=x2+1;
																	}
																x1 = x1+1 ;
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
		<%
		Connection conn = null;
		conn = Dao.getConnection();
		Statement x = null;
		ResultSet rs = null ;
		%>

		
		
			
	
	
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
	
	
	
	<div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  
  
  <ul class="carousel-indicators">

			
	<li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
			
 
  </ul>
  <!-- The slideshow -->
  <div class="carousel-inner banner01">
  
   
      <%		try {
    	  				
						x = conn.createStatement();
						rs = x.executeQuery("select e.url_sito_evento , e.url_img_evento from eventi as e where data_inizio>= now() order by data_inizio ASC limit 3");
						rs.next();
						out.print("<div align='center' class='banner01 carousel-inner carousel-item active'><a href='"+ rs.getString("url_sito_evento") +"'><img src='" + rs.getString("url_img_evento") +"' style='width:auto ; height:300px;'></a></div>");
						while (rs.next()) {
							out.print("<div align='center' class='banner01 carousel-inner carousel-item'><a href='"+ rs.getString("url_sito_evento") +"'><img src='" + rs.getString("url_img_evento") + "' style='width:auto ; height:300px;'></a></div>");
									}
					}
					catch (Exception e) {
						out.println("wrong entry" + e);
					}
		%>

  </div>
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>
	
	


	<div align="center" class="row sticky-top banner01"
		style="overflow: auto; padding: 10px; margin: 0px; min-width: 100%; max-width: 100%; background-color: rgba(128, 0, 0, 0.0);">
		<a id="linkGETricerca" href="../ControllerHomepage?da=1"><img
			style="padding-left: 5px; height: 40px;"
			src="../images/search-icon2.png" /></a>
		<div class="col">
			<a href="#catAPRI" data-toggle="collapse" class="linkAPRIricerca banner01">
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
					}
					catch (Exception e) {
						out.println("wrong entry" + e);
					}
				%>
			</div>
		</div>
		<div class="col">
			<a href="#regAPRI" data-toggle="collapse" class="linkAPRIricerca banner01">
				Regione </a>
			<div id="regAPRI" class="collapse">
				
<select  id= 'regSELEZIONATO'>
<option id='primoReg'  value='null'> seleziona </option>
			<c:forEach var="j" items="${sessionScope.reg22}">
				<option  value="<c:out value="${j.id_regione}"></c:out>"> <c:out value="${j.nome_regione}"></c:out>	 </option> 
			</c:forEach>	
			
			</select>		
			</div>
		</div>
		<div class="col">
			<a id="aProvincia" href="#proAPRI" data-toggle="collapse"
				class="linkAPRIricerca banner01"> Provincia </a>
			<div id="proAPRI2" class="collapse"></div>
			<div id="proAPRI" class="collapse">
				<select id="pro11">
					<option value="null">seleziona</option>
				</select>
			</div>
		</div>
		<div class="col">
			<a id="aComune" href="#comAPRI" data-toggle="collapse"
				class="linkAPRIricerca banner01"> Comune </a>
			<div id="comAPRI" class="collapse">
				<select id="com11">
					<option value="null">seleziona</option>
				</select>
			</div>
		</div>
		<div class="col">
			<input type="date" id="inizio" class="form-control"
				onchange="dataEccessivainizio()" style="max-width: 100%;">
		</div>
		<div class="col">
			<input type="date" id="fine" onchange="dataEccessivafine()"
				class="form-control" style="max-width: 100%;">
		</div>
	</div>
	<div align="center" class="row" style="max-width: 100%; padding: 30px;">
		<div class="col-sm-2">
			<button type="button" class="btn btn-secondary"
				style="background-color: black !important;" id="cambiavedi">cambia
				visualizzazione</button>
		</div>
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
				<c:forEach var="j" items="${sessionScope.risultatoRicerca}">
					<tr>
						<td class="bordini">
							<div class="card" class="bordini">
								<div class="card-body" class="bordini">
									<table style="width: 100%" id="tabellaLarga">
										<tr>
											<td style="width: 150px;">
											<img style="width: 150px; height: 150px; margin-right: 20px;"
												src="<c:out value='${j.url_img_evento }'></c:out>" />
												</td>
												
												
											<td style="float: left;">
												<h2 style="float: left;" class="card-title">
													<c:out value="${j.nome_evento }"></c:out>
												</h2> <br> <br>
											<br>
												<p class="card-text">
													<c:out value="${j.descrizione }"></c:out>
												</p> <a href="<c:out value="${j.url_sito_evento}"></c:out>"
												class="card-link"> link evento</a> 
											<a href="<c:out value="${j.url_sito_ente}"></c:out>"
												class="card-link"> link ente</a> 
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