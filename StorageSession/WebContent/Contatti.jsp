<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="Header.html" %> 
<!DOCTYPE html>
<html lang="it">
<head>
	<meta charset="UTF-8">
	<title>Contatti</title>
	<link rel="stylesheet" href="ContattiStyle.css">
</head>
<body>
	<main>
		<section>
			<h2>Informazioni di contatto</h2>
			<p>Per contattarci, puoi utilizzare i seguenti canali:</p>
			<ul>
				<li>Email: <a href="mailto:info@sigaretteelettroniche.it">info@sigaretteelettroniche.it</a></li>
				<li>Telefono: <a href="tel:+390123456789">0123 456789</a></li>
				<li>Indirizzo: Via Roma 1, 00100 Roma</li>
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
	<footer>
		<p>&copy; 2023 Sigarette Elettroniche Srl - Tutti i diritti riservati</p>
	</footer>
</body>
</html>
