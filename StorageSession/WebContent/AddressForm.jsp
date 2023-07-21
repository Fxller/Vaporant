<%@ include file="Header.jsp" %> 


<%

	UserBean user = null;

	if(session.getAttribute("user") == null)
	{
		request.getSession().setAttribute("action", "address");
		response.sendRedirect("loginForm.jsp");
	}
	else
	{
		user = (UserBean) session.getAttribute("user");  		
		request.getSession().setAttribute("user", user);
		
	}
%>
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="it.unisa.model.UserBean"%>
<head>
	<title>Registrazione Indirizzo</title>
	 <link rel="stylesheet" type="text/css" href="SignFormStyle.css">
	
</head>
<body>
	<jsp:include page="Header.jsp" />
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
        <input id="via" class="input" type="text" name="via" placeholder=" " required>
        <div class="cut"></div>
        <label for="via" class="placeholder">Via</label>
      </div>
      <div class="input-container ic1">
        <input id="numCivico" class="input" type="text" name="numCivico" placeholder=" " required>
        <div class="cut"></div>
        <label for="numCivico" class="placeholder">Numero Civico</label>
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