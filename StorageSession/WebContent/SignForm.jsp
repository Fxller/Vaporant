<%@ include file="Header.html" %> 
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
        <input id="citta" class="input" type="text" name="citta" placeholder=" " required>
        <div class="cut"></div>
        <label for="citta" class="placeholder">Citta'</label>
      </div>
      <div class="input-container ic1">
        <input id="provincia" class="input" type="text" name="provincia" placeholder=" " required>
        <div class="cut"></div>
        <label for="provincia" class="placeholder">Provincia</label>
      </div>
      <div class="input-container ic1">
        <input id="cap" class="input" type="text" name="cap" placeholder=" " required>
        <div class="cut"></div>
        <label for="cap" class="placeholder">CAP</label>
      </div>
      <div class="input-container ic1">
        <input id="voa" class="input" type="text" name="via" placeholder=" " required>
        <div class="cut"></div>
        <label for="via" class="placeholder">Via</label>
      </div>
      <div class="input-container ic1">
        <input id="numero_civico" class="input" type="text" name="numero_civico" placeholder=" " required>
        <div class="cut"></div>
        <label for="numero_civico" class="placeholder">Numero Civico</label>
      </div>
      <div class="input-container ic1">
        <input id="stato" class="input" type="text" name="stato" placeholder=" " required>
        <div class="cut"></div>
        <label for="stato" class="placeholder">Stato</label>
      </div>
		<input type="submit" value="Registrati" class="submit">
	</form>
</div>
</body>
</html>