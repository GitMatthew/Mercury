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
.fakeimg {
	height: 200px;
	background: #aaa;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark"> <a
		class="navbar-brand" href="#">Navbar</a>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
	
	
	
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="#">Home
			</a></li>
		</ul>
		<form class="form-inline ">
			<li class="nav-item"><a class="nav-link" href="#">Login</a></li>
			<li class="nav-item"><a class="nav-link " href="#">Registrazione</a></li>
		</form>
	</div>
	</nav>
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<h3>MERCURY EVENTS</h3>
		<p>
			<em>Gli eventi in Italia che aspettano solo il tuo click </em>
		</p>
		<p>cerca tutti gli eventi italiani scegliendo la categoria che
			preferisci, i luoghi che ami, o i giorni che ti stanno pi� comodi</p>
	</div>
	<%
		Connection conn = null;
		conn = Dao.getConnection();
		Statement x = null;
		ResultSet rs = null;
	%>
	<script>
		function ricerca() {
			var ric = "../ControllerHomepage?";
			var x = "categoria="
					+ document.getElementById("catSELEZIONATO").value;
			ric = ric + x;

			document.getElementById("linkGETricerca").href = ric;
			document.getElementById("p04").innerHTML;
		}
	</script>
	<p id="p04"></p>
	<div class="row sfondoRicerca row-dark bg-dark sticky-top">
		<a id="linkGETricerca" href=" data-toggle="collapse">
			<button onclick="ricerca()">ricerca</button>
		</a>
		<div class="col">
			<a href="#catAPRI" data-toggle="collapse">
				<button>Categoria</button>
			</a>
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
			<a href="#reg" data-toggle="collapse">
				<button>Regione</button>
			</a>
			<div id="reg" class="collapse">
				<%
					try {
						x = conn.createStatement();
						rs = x.executeQuery("select nome_regione from regioni order by nome_regione ASC");

						out.print("<select>");
						while (rs.next()) {
							out.print("<option>");
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
			<a href="#prov" data-toggle="collapse">
				<button>Provincia</button>
			</a>
			<div id="prov" class="collapse">
				<%
					try {
						x = conn.createStatement();
						rs = x.executeQuery("select nome_provincia from province order by nome_provincia ASC");

						out.print("<select>");
						while (rs.next()) {
							out.print("<option>");
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
			<a href="#com" data-toggle="collapse">
				<button>Comune</button>
			</a>
			<div id="com" class="collapse">
				<%
					try {
						x = conn.createStatement();
						rs = x.executeQuery("select nome_comune from comuni order by nome_comune ASC");

						out.print("<select>");
						while (rs.next()) {
							out.print("<option>");
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
				onchange="myFunction()">
		</div>
		<div class="col">
			<input type="date" id="fine" onchange="dataEccessiva()"
				class="form-control">
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
	<div class="container" style="margin-top: 30px">
		<div class="row">
			<div class="col-sm-8">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">Card title</h4>
						<p class="card-text">Some example text. Some example text.</p>
						<a href="#" class="card-link">Card link</a> <a href="#"
							class="card-link">Another link</a>
					</div>
				</div>
				<br>
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">Card title</h4>
						<p class="card-text">Some example text. Some example text.</p>
						<a href="#" class="card-link">Card link</a> <a href="#"
							class="card-link">Another link</a>
					</div>
				</div>
				<br>
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">Card title</h4>
						<p class="card-text">Some example text. Some example text.</p>
						<a href="#" class="card-link">Card link</a> <a href="#"
							class="card-link">Another link</a>
					</div>
				</div>
				<br>
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">Card title</h4>
						<p class="card-text">Some example text. Some example text.</p>
						<a href="#" class="card-link">Card link</a> <a href="#"
							class="card-link">Another link</a>
					</div>
				</div>
				<br>
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">Card title</h4>
						<p class="card-text">Some example text. Some example text.</p>
						<a href="#" class="card-link">Card link</a> <a href="#"
							class="card-link">Another link</a>
					</div>
				</div>
				<hr class="d-sm-none">
			</div>
			<div class="col-sm-4">
				<div class="fakeimg">
					<br>
					<center>
						<h5>Iscriviti alla NewsLetter</h5>
					</center>
				</div>
				<br>
				<div class="fakeimg">
					<center>
						<h3>Publicita</h3>
					</center>
				</div>
				<br>
				<div class="fakeimg">
					<center>
						<h3>Publicita</h3>
					</center>
				</div>
				<br>
			</div>
		</div>
	</div>
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>Footer</p>
	</div>
	</div>
</body>
</html>