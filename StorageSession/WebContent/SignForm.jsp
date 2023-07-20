<!DOCTYPE html>
<html>
<head>
	<title>Registrazione Utente</title>
	 <link rel="stylesheet" type="text/css" href="SignFormStyle.css">
	
</head>
<body>
<div class="formDiv">
	<form action="SignControl" method="POST" class="form">
      <div class="title">Registrazione Utente</div>
      <div class="subtitle">Crea il tuo Account!</div>
      <div class="input-container ic1">
        <input id="nome" class="input" type="text" name="nome" placeholder=" " required>
        <div class="cut"></div>
        <label for="nome" class="placeholder">Nome</label>
      </div>
      <div class="input-container ic1">
        <input id="cognome" class="input" type="text" name="cognome" placeholder=" " required>
        <div class="cut"></div>
        <label for="cognome" class="placeholder">Cognome</label>
      </div>
      <div class="input-container ic1">
        <input id="data_nascita" class="input" type="date" name="data_nascita" placeholder=" " required>
        <div class="cut"></div>
        <label for="data_nascita" class="placeholder">Data di nascita</label>
      </div>
      <div class="input-container ic1">
        <input id="codice_fiscale" class="input" type="text" name="codice_fiscale" placeholder=" " required>
        <div class="cut"></div>
        <label for="codice_fiscale" class="placeholder">Codice Fiscale</label>
      </div>
      <div class="input-container ic1">
        <input id="telefono" class="input" type="tel" name="telefono" placeholder=" " required>
        <div class="cut"></div>
        <label for="telefono" class="placeholder">Numero di telefono</label>
      </div>
      <div class="input-container ic1">
        <input id="email" class="input" type="email" name="email" placeholder=" " required>
        <div class="cut"></div>
        <label for="email" class="placeholder">Email</label>
      </div>
      <div class="input-container ic1">
        <input id="password" class="input" type="password" name="password" placeholder=" " required>
        <div class="cut"></div>
        <label for="nome" class="placeholder">Password</label>
      </div>
      <div class="input-container ic1">
        <input id="indirizzoFatt" class="input" type="text" name="indirizzoFatt" placeholder=" " required>
        <div class="cut"></div>
        <label for="nome" class="placeholder">Indirizzo Fatturazione</label>
		<input type="submit" value="Registrati" class="submit">
	</div>
	</form>
</div>
</body>
</html>