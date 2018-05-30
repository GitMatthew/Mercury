<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.corso.connection.Dao"%>
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
}

#box3, #box4, #box1, #box2 {
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
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark"> <a
		class="navbar-brand" href="../ControllerHomepage?da=0">LOGO </a>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">

		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link"
				href="../ControllerHomepage?da=0">Home</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Login</a></li>
			<li class="nav-item"><a class="nav-link " href="#">Registrazione</a></li>
		</ul>
	</div>
	</nav>
	<div class="jumbotron text-center"
		style="margin: 0px; padding: 0px 30px 0px 30px; color: white; background-image: url('../images/bannerHome1.jpg'); background-repeat: no-repeat; background-position: center; background-size: cover;">
		<h1 style="color: #f54b03; text-shadow: 0px 0px 5px #ffffff;"">MERCURY
			EVENTS</h1>
		<br>
		<h3 style="color: #f54b03; text-shadow: 0px 0px 5px #ffffff;"">Gli
			eventi in Italia che aspettano solo il tuo click</h3>
		<br>

		<h2 style="color: #f54b03; text-shadow: 0px 0px 5px #ffffff;">
			cerca tutti gli eventi italiani scegliendo la categoria che
			preferisci, i luoghi che ami, <br> o i giorni che ti stanno più
			comodi
		</h2>
	</div>
	<%
		Connection conn = null;
		conn = Dao.getConnection();
		Statement x = null;
		ResultSet rs = null;
	%>
	<script>
		function ricerca() {
			var ric = "../ControllerHomepage?da=1&";
			ric = ric + "categoria=";
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
			document.getElementById("linkGETricerca").href = ric;
		}
	</script>

	<div align="center" class="row sticky-top"
		style="overflow: auto; padding: 10px; max-width: 100%; background-color: rgba(128, 0, 0, 0.4);">
		<a id="linkGETricerca" onclick="ricerca()" href="#"
			data-toggle="collapse"> <img src="../images/search-icon.png"
			style="padding-left: 10px; height: 40px;">
		</a>
		<div class="col">
			<a href="#catAPRI" data-toggle="collapse" class="linkAPRIricerca">
				Categoria </a>
			<div id="catAPRI" class="collapse">
				<%
					try {
						x = conn.createStatement();
						rs = x.executeQuery("select nome_categoria from categorie order by nome_categoria ASC");

						out.print("<select id= 'catSELEZIONATO'>");
						out.print("<option value='null'> null </option> ");
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
			<a href="#regAPRI" data-toggle="collapse" class="linkAPRIricerca">
				Regione </a>
			<div id="regAPRI" class="collapse">
				<%
					try {
						x = conn.createStatement();
						rs = x.executeQuery("select nome_regione from regioni ");

						out.print("<select id= 'regSELEZIONATO'>");
						out.print("<option value='null'> null </option> ");
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
			<a href="#proAPRI" data-toggle="collapse" class="linkAPRIricerca">
				Provincia </a>
			<div id="proAPRI" class="collapse">
				<%
					try {
						x = conn.createStatement();
						rs = x.executeQuery("select nome_provincia from province ");

						out.print("<select id= 'proSELEZIONATO'>");
						out.print("<option value='null'> null </option> ");
						while (rs.next()) {
							out.print("<option value='" + rs.getString("nome_provincia") + "'>");
							out.print(rs.getString("nome_provincia"));
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
			<a href="#comAPRI" data-toggle="collapse" class="linkAPRIricerca">
				Comune </a>
			<div id="comAPRI" class="collapse">
				<%
					try {
						x = conn.createStatement();
						rs = x.executeQuery("select nome_comune from comuni ");

						out.print("<select id= 'comSELEZIONATO'>");
						out.print("<option value='null'> null </option> ");
						while (rs.next()) {
							out.print("<option value='" + rs.getString("nome_comune") + "'>");
							out.print(rs.getString("nome_comune"));
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
				} else {
					document.getElementById("fine").style.backgroundColor = "white";
				}
			}
		</script>
	</div>


	<br>
	<br>

	<div align="center" class="row" style="max-width: 98%; padding: 20px;">
		<div class="col-sm-9">
			<table class="table table-dark table-hover">
				<thead>
					<tr>
						<th>img</th>
						<th>titolo</th>
						<th>categoria</th>
						<th>descrizione</th>
						<th>comune</th>
						<th>dataInizio</th> 
						<th>dataFine</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>i i i i</td>
						<td>sagra della porchetta</td>
						<td>musica</td>
						<td>alla sagra della porchetta puoi mangiare ottime porzioni di porchetta con pochi euri </td>
						<td>ariccia</td>
						<td>2018-09-09</td>
						<td>2018-09-09</td>
					</tr>
				</tbody>
			</table>

		</div>

		<div class="col-sm-3">
			<div id="box1" class="boxDestra">
				<h2>iscriviti</h2>
			</div>
			<br> <br>
			<div id="box2" class="boxDestra"></div>
			<br> <br>
			<div id="box3" class="boxDestra"></div>
			<br> <br>
			<div id="box4" class="boxDestra"></div>
			<br> <br>
		</div>
	</div>



	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>


	<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>Footer</p>
	</div>

</body>
</html>