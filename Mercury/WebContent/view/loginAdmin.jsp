<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="US-ASCII">
<title>Login Administrator</title>
</head>
<body Background=../images/adminLoginBg.jpg>

<h1 style="color:gray;text-align:center">Effettua il Login</h1>

<div align=center>
<form method="post" action="../ControllerAdmin">

<table border="1">
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