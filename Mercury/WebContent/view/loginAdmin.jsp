<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="US-ASCII">
  <title>Administrator Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body Background=../images/adminLoginBg.jpg>

<center><nav style="display:inline-block" class="navbar navbar-default">
  <div class="container-fluid">
  	 <ul class="nav navbar-nav">
      <li class="active"><a href="../ControllerHomepage?da=0">Home Page</a></li>
     </ul>
  </div>
</nav></center>

<h1 style="color:White;text-align:center">Effettua il Login</h1>

<div align=center>
<form method="post" action="../ControllerAdmin">

<table border="2">
		<tr>
		<td><input type="text" name="user"></td>
		<td><h3 style="color:White" >Inserisci Username</h3></td>
		</tr>
		<tr>
		<td><input type="password" name="psw"></td>
		<td><h3 style="color: White " >Inserisci Password</h3></td>
		</tr>
		<tr> 
		<td align=center><input type="submit"></td>
		<td align=center><input type="reset"></td> 
		</tr>
</table> 
</form>	
</div>

<div align=center>  

<a style="color:Red;text-align:center" ><%
if (session.getAttribute("rst")!=null)
	{
	
	out.print(session.getAttribute("rst"));
	session.invalidate();
	}
%></a>
</div>


</body>
</html>