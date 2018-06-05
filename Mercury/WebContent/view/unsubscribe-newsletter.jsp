<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="it-IT">
<head>
<link rel="stylesheet" type="text/css" href="stile.css">
	<title>Mercury</title>
	<link rel="shortcut icon" href="images/favicon.gif" />
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<!--[if IE]>
<link rel="stylesheet" type="text/CSS" href="ie.css">
<script type="text/javascript" src="curvycorners.js"></script>
<script type="text/javascript">
addEvent(window, 'load', initCorners);
    
function initCorners() {
    var settings = {
        tl: { radius: 20 },
        tr: { radius: 20 },
        bl: { radius: 20 },
        br: { radius: 20 },
        antiAlias: true
    }
    
    curvyCorners(settings, "#round");
    }     
</script>
<![endif]-->
</head>
<body>
	<div id="pagina" class="border-radius">
		<div id="logo" class="border-radius">
			<a href="/index.html" title="Mercury"><img src="images/logo.png"
				border="0"></a>
		</div>

		<div id="menu"
			style="border-top: 5px solid #0041C2; border-bottom: 5px solid #0041C2;">
			<ul>
				<li><a href="../ControllerHomepage?da=0" title="Mercury"
					class="active">> Home</a></li>
				<li><a href="../ControllerNewsletter?n=0"
					title="Iscrizione Newsletter">Iscrizione Newsletter</a></li>
				<li><a href="registraEnte.jsp" title="Iscrizione Ente">Iscrizione
						Ente</a></li>
				<li><a href="loginEnte.jsp" title="Login Ente">Login Ente</a></li>
			</ul>
		</div>

		<div id="menu" style="border-bottom: 6px solid #0041C2;">
			<ul>
				<li><a href="" title="Mercury">Ricerca</a></li>
				<li><a href="" title="Ricerca">Ricerca</a></li>
				<li><a href="" title="Ricerca">Ricerca</a></li>
				<li><a href="" title="Ricerca">Ricerca</a></li>
				<li><a href="" title="Ricerca">Ricerca</a></li>
				<li><a href="" title="Ricerca">Ricerca</a></li>
				<li><a href="" title="Ricerca">Ricerca</a></li>
				<li><a href="" title="Ricerca">Ricerca</a></li>
			</ul>
		</div>



		<div id="contenuto">
			<div id="box" class="border-radius">
				<h1>Procedi con la disiscrizione</h1>
				<br>
					<center>
						<h2 style="text-align: center">Digita la tua email e conferma</h2>

						<form method="get" action="../ControllerNewsletter">
							<input type="hidden" name="n" value="8"> <input
								type="text" name="email" value="Inserisci la tua email"
								size="25" onfocus="this.value =''"> <input type="submit"
									value="Disiscriviti"> <%
 	String s = (String) session.getAttribute("stampa");
 %> <%
											if (s != null) {
												out.println("<h3 style='text-align: center'><font color='red'>" + s + "</font></h3>");
												s = "";
											}
										%>
						</form>
						<br></br> <br></br> <br></br> <br></br> <br></br> <br></br> <br></br>
						<br></br> <br></br> <br></br>
					</center>
			</div>




			<div id="box2" class="border-radius">
				<a href="registraEnte.jsp" title="Registrazione Enme"><img
					src="images/ente.png"></a>
			</div>


			<div id="footer"></div>
		</div>
	</div>
</body>
</html>