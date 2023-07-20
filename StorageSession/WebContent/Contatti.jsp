<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!DOCTYPE html>
<html lang="it">
<head>
	<meta charset="UTF-8">
	<title>Contatti Vaporant</title>
	<link rel="stylesheet" href="ContattiStyle.css">
</head>
<body>
	<jsp:include page="Header.jsp" />
	<main>
		<section>
			<h2>Informazioni di contatto</h2>
			<p>Per contattarci, puoi utilizzare i seguenti canali:</p>
			<ul>
				<li>Email: <a href="mailto:info@francescocorcione.it">info@francescocorcione.it</a></li>
				<li>Telefono: <a href="tel:+393280000000">3280 000000</a></li>
				<li>Indirizzo: Via Fratelli Napoli 1, 00100 Lancusi</li>
			</ul>
		</section>
		<section>
			<h2>Modulo di contatto</h2>
			<form>
				<label for="nome">Nome:</label>
				<input type="text" id="nome" name="nome" required>
				<label for="email">Email:</label>
				<input type="email" id="email" name="email" required>
				<label for="messaggio">Messaggio:</label>
				<textarea id="messaggio" name="messaggio" rows="5" required></textarea>
				<button type="submit">Invia</button>
			</form>
		</section>
	</main>
	<jsp:include page="Footer.jsp" />
</body>
</html>
