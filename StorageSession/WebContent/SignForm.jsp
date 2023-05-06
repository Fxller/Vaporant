<!DOCTYPE html>
<html>
<head>
	<title>Registrazione Utente</title>
	 <link rel="stylesheet" type="text/css" href="SignFormStyle.css">
	
</head>
<body>
	<h1>Registrazione Utente</h1>
	<form method="post" action="SignControl">
		<label for="nome">Nome:</label>
		<input type="text" id="nome" name="nome" required><br><br>
		
		<label for="cognome">Cognome:</label>
		<input type="text" id="cognome" name="cognome" required><br><br>
		
		<label for="data_nascita">Data di Nascita:</label>
		<input type="date" id="data_nascita" name="data_nascita" required><br><br>
		
		<label for="codice_fiscale">Codice Fiscale:</label>
		<input type="text" id="codice_fiscale" name="codice_fiscale" required><br><br>
		
		<label for="telefono">Numero di Telefono:</label>
		<input type="tel" id="telefono" name="telefono" required><br><br>
		
		<label for="email">Email:</label>
		<input type="email" id="email" name="email" required><br><br>
		
		<label for="password">Password:</label>
		<input type="password" id="password" name="password" required><br><br>
		
		<label for="citta">Città:</label>
		<input type="text" id="citta" name="citta" required><br><br>
		
		<label for="provincia">Provincia:</label>
		<input type="text" id="provincia" name="provincia" required><br><br>
		
		<label for="cap">CAP:</label>
		<input type="text" id="cap" name="cap" required><br><br>
		
		<label for="via">Via:</label>
		<input type="text" id="via" name="via" required><br><br>
		
		<label for="numero_civico">Numero Civico:</label>
		<input type="text" id="numero_civico" name="numero_civico" required><br><br>
		
		<label for="stato">Stato:</label>
		<input type="text" id="stato" name="stato" required><br><br>
		
		<input type="submit" value="Registrati">
	</form>
</body>
</html>
