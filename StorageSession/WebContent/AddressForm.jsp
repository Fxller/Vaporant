<%@ include file="Header.html" %> 


<%
	 String user = null;
	 String psw = null;
	 
	if(session.getAttribute("user") == null)
	{
		request.getSession().setAttribute("action", "address");
		response.sendRedirect("loginForm.jsp");
	}
	else
	{
		user = (String)session.getAttribute("user");  
		psw = (String) session.getAttribute("psw");
		
		request.getSession().setAttribute("user", user);
		request.getSession().setAttribute("psw", psw);
		
	}
%>

<!DOCTYPE html>
<html>
<head>
	<title>Registrazione Indirizzo</title>
	 <link rel="stylesheet" type="text/css" href="SignFormStyle.css">
	
</head>
<body>
<div class="formDiv">
	<form action="AddressControl" method="POST" class="form">
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
		<input type="submit" value="Aggiungi" class="submit">
	</form>

	
</div>
</body>
</html>