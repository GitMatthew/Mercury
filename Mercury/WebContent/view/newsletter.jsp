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
				<h1>Iscriviti alla Newsletter!</h1>

				<div style="text-align: left; padding: 10px">
					<h2>Configura inserimento di un Luogo:</h2>
					<form method="get" action="../ControllerNewsletter">
						<p style="display: inline">Inserisci Regione:</p>
						<input type="hidden" name="n" value="1"> <c:choose>
								<c:when test="${sessionScope.regioneScelta!=null}">
									<select name="regione" style="margin: 10px">
										<option value="${sessionScope.regioneScelta.id_regione}"><c:out
												value="${sessionScope.regioneScelta.nome_regione}"></c:out></option>
									</select>
								</c:when>
								<c:otherwise>
									<select name="regione" id="regione" style="margin: 10px" onchange="this.form.submit()">
										<option>Seleziona</option>
										<c:forEach var="j" items="${sessionScope.regioni}">
											<option value="${j.id_regione}"><c:out
													value="${j.nome_regione }"></c:out></option>
										</c:forEach>
									</select>
								</c:otherwise>
							</c:choose> <input type="hidden" name="regione" value="regione"> <noscript><input
								type="submit" name="submit" value="Inserisci regione"></noscript>
					</form>

					<form method="get" action="../ControllerNewsletter">
						<p style="display: inline">Inserisci Provincia:</p>
						<input type="hidden" name="n" value="2"> <c:choose>
								<c:when test="${sessionScope.provinciaScelta!=null}">
									<select name="provincia" style="margin: 10px">
										<option value="${sessionScope.provinciaScelta.id_provincia}"><c:out
												value="${sessionScope.provinciaScelta.nome_provincia}"></c:out></option>
									</select>
								</c:when>
								<c:otherwise>
									<select name="provincia" id="provincia" style="margin: 10px" onchange="this.form.submit()">
										<option>Seleziona</option>
										<c:forEach var="j" items="${sessionScope.province}">
											<option value="${j.id_provincia}"><c:out
													value="${j.nome_provincia}"></c:out></option>
										</c:forEach>
									</select>
								</c:otherwise>
							</c:choose><input type="hidden" name="provincia" value="provincia">
								<noscript><input type="submit" name="submit" value="Inserisci provincia"></noscript>
					</form>

					<form method="get" action="../ControllerNewsletter">
						<p style="display: inline">Inserisci Comune:</p>
						<input type="hidden" name="n" value="3"> <c:choose>
								<c:when test="${sessionScope.comuneScelta!=null}">
									<select name="comune" style="margin: 10px">
										<option value="${sessionScope.comuneScelta.id_comune}"><c:out
												value="${sessionScope.comuneScelta.nome_comune}"></c:out></option>
									</select>
								</c:when>
								<c:otherwise>
									<select name="comune" id="comune" style="margin: 10px" onchange="this.form.submit()">
										<option>Seleziona</option>
										<c:forEach var="j" items="${sessionScope.comuni}">
											<option value="${j.id_comune}"><c:out
													value="${j.nome_comune }"></c:out></option>
										</c:forEach>
									</select>
								</c:otherwise>
							</c:choose> <input type="hidden" name="comune" value="comune"><noscript><input
								type="submit" name="submit" value="Conferma comune"></noscript>
					</form>

					<form method="get" action="../ControllerNewsletter">
						<input type="hidden" name="n" value="4"> <input
							type="submit" name="reset" value="Reset Campi"
							style="margin: 10px">
					</form>

					<h2>Aggiungi o Rimuovi Luogo:</h2>
					<form method="get" action="../ControllerNewsletter">
						<input type="hidden" name="n" value="5"> <input
							type="submit" name="luogo" value="Inserisci Luogo"
							style="float: left; margin: 10px;">
					</form>

					<form method="get" action="../ControllerNewsletter">
						<input type="hidden" name="n" value="6"> <input
							type="submit" name="luogo" value="Rimuovi tutti i Luoghi"
							style="float: left; margin: 10px;">
					</form>

					<c:choose>
						<c:when test="${sessionScope.luoghi.size()>0}">
							<br></br>
							<br></br>
							<h2>Lista iscrizione luoghi della Newsletter:</h2>
							<c:forEach items="${sessionScope.luoghi}" var="current">
								<p style="color: red; display: inline;">
									<c:out value="Luogo:"></c:out>
								</p>
								<p style="display: inline;">
									<c:out
										value="${current.regione.nome_regione} ${current.provincia.nome_provincia} ${current.comune.nome_comune}" />
								</p>
								<p>-------------------------------------------------</p>
							</c:forEach>
							<p>
								<a href="../view/newsletter2.jsp">Fine inserimento? Prosegui
									con l'iscrizione alla Newsletter...</a>
							</p>
						</c:when>
						<c:otherwise>
							<br></br>
							<br></br>
							<br></br>
						</c:otherwise>
					</c:choose>

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