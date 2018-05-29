<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="US-ASCII">
<title>Login Administrator</title>
</head>
<body>

<h1 style="color:gray;text-align:center">Pagina di Login</h1>

<div align=center>
<form method="post" action="../ControllerAdmin">

<table border="1">
		<tr>
		<td><input type="text" name="user"></td>
		<td><h3>Inserisci Username</h3></td>
		</tr>
		<tr>
		<td><input type="password" name="psw"></td>
		<td><h3>Inserisci Password</h3></td>
		</tr>
		<tr>
		<td align=center><input type="submit"></td>
		<td align=center><input type="reset"></td>
		</tr>
</table>
</form>	
</div>

<div align=center>

<a style="color:gray;text-align:center" ><%
if (request.getAttribute("rst")!=null)
	{
	
	out.print(request.getAttribute("rst"));
	
	}
%></a>
</div>

</body>
</html>