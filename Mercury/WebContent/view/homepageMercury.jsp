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
			preferisci, i luoghi che ami, o i giorni che ti stanno più comodi</p>
	</div>

	<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">

	<%
		Connection conn = null;
		conn = Dao.getConnection();
		Statement x = null;
		ResultSet rs = null;
	%> <a class="navbar-brand" href="#">Logo</a>
	<div class="btn-group">
		<button type="button" class="btn btn-categorie dropdown-toggle "
			data-toggle="dropdown">Categorie</button>

		<div class="dropdown-menu">
			<a class="dropdown-item" href="#">Link 1</a> <a class="dropdown-item"
				href="#">Link 2</a>
		</div>
	</div>

	<div class="btn-group">

		<button type="button"
			class="btn btn-regioni dropdown-toggle dropdown-toggle-split"
			data-toggle="dropdown">Regioni</button>
		<div class="dropdown-menu">
			<%
				try
				{
					x = conn.createStatement();
					rs = x.executeQuery("select nome_categoria from categorie");

					out.print("<select>");
					while (rs.next())
					{
						out.print("<option>");
						out.print(rs.getString("nome_categoria"));
						out.print("</option>");
					}
					out.print("</select>");
				} catch (Exception e)
				{
					out.println("wrong entry" + e);
				}
			%>
		</div>
	</div>

	</nav>

	<div class="container-fluid" style="margin-top: 80px">

		<div class="card">
			<div class="card-body">
				<h4 class="card-title">Card title</h4>
				<p class="card-text">Some example text. Some example text.</p>
				<a href="#" class="card-link">Card link</a> <a href="#"
					class="card-link">Another link</a>
			</div>
		</div>

		<div class="card">
			<div class="card-body">
				<h4 class="card-title">Card title</h4>
				<p class="card-text">Some example text. Some example text.</p>
				<a href="#" class="card-link">Card link</a> <a href="#"
					class="card-link">Another link</a>
			</div>
		</div>

		<div class="card">
			<div class="card-body">
				<h4 class="card-title">Card title</h4>
				<p class="card-text">Some example text. Some example text.</p>
				<a href="#" class="card-link">Card link</a> <a href="#"
					class="card-link">Another link</a>
			</div>
		</div>


		<div class="card">
			<div class="card-body">
				<h4 class="card-title">Card title</h4>
				<p class="card-text">Some example text. Some example text.</p>
				<a href="#" class="card-link">Card link</a> <a href="#"
					class="card-link">Another liink</a>
			</div>
		</div>


		<div class="card">
			<div class="card-body">
				<h4 class="card-title">Card title</h4>
				<p class="card-text">Some example text. Some example text.</p>
				<a href="#" class="card-link">Card link</a> <a href="#"
					class="card-link">Another link</a>
			</div>
		</div>

		<div class="card">
			<div class="card-body">
				<h4 class="card-title">Card title</h4>
				<p class="card-text">Some example text. Some example text.</p>
				<a href="#" class="card-link">Card link</a> <a href="#"
					class="card-link">Another link</a>
			</div>
		</div>

		<div class="card">
			<div class="card-body">
				<h4 class="card-title">Card title</h4>
				<p class="card-text">Some example text. Some example text.</p>
				<a href="#" class="card-link">Card link</a> <a href="#"
					class="card-link">Another link</a>
			</div>
		</div>

		<div class="card">
			<div class="card-body">
				<h4 class="card-title">Card title</h4>
				<p class="card-text">Some example text. Some example text.</p>
				<a href="#" class="card-link">Card link</a> <a href="#"
					class="card-link">Another link</a>
			</div>
		</div>

		<div class="card">
			<div class="card-body">
				<h4 class="card-title">Card title</h4>
				<p class="card-text">Some example text. Some example text.</p>
				<a href="#" class="card-link">Card link</a> <a href="#"
					class="card-link">Another link</a>
			</div>
		</div>

		<div class="card">
			<div class="card-body">
				<h4 class="card-title">Card title</h4>
				<p class="card-text">Some example text. Some example text.</p>
				<a href="#" class="card-link">Card link</a> <a href="#"
					class="card-link">Another link</a>
			</div>
		</div>

		<div class="card">
			<div class="card-body">
				<h4 class="card-title">Card title</h4>
				<p class="card-text">Some example text. Some example text.</p>
				<a href="#" class="card-link">Card link</a> <a href="#"
					class="card-link">Another link</a>
			</div>
		</div>
	</div>


	<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>Footer</p>
	</div>
	</div>
</body>


</html>