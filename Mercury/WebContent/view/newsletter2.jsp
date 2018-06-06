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
				<li><a href="../ControllerHomepage?da=0" title="Mercury" class="active">> Home</a></li>
				<li><a href="../ControllerNewsletter?n=0" title="Iscrizione Newsletter">Iscrizione Newsletter</a></li>
				<li><a href="registraEnte.jsp" title="Iscrizione Ente">Iscrizione Ente</a></li>
				<li><a href="loginEnte.jsp" title="Login Ente">Login Ente</a></li>
			</ul>
		</div>

		


		<div id="contenuto">
			<div id="box" class="border-radius">
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
				</div>
			</div>

			<div id="box2" class="border-radius">
				<a href="../ControllerNewsletter?n=0" title="Newsletter"><img src="images/newsletter.png"></a>
			</div>

			<div id="box2" class="border-radius">
				<a href="registraEnte.jsp" title="Registrazione Ente"><img src="images/ente.png"></a>
			</div>


			<div id="footer"></div>
		</div>
	</div>
</body>
</html>