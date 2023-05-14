<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="footerStyle.css">
</head>
<body>
<footer>
  <div class="container">
    <div class="footer-content">
      <div class="footer-column">
        <h3>Informazioni</h3>
        <ul>
          <li><a href="ChiSiamo.jsp">Chi siamo</a></li>
          <li><a href="Contatti.jsp">Contatti</a></li>
          <li><a href="TerminiCondizioni.jsp">Termini e condizioni</a></li>
          <li><a href="PrivacyPolicy.jsp">Privacy Policy</a></li>
        </ul>
      </div>
      <div class="footer-column">
        <h3>Prodotti</h3>
        <ul>
        
        	<% if(session.getAttribute("tipo").equals("admin")) {%>
        	 	<li><a href="ProductViewAdmin.jsp">Sigarette elettroniche</a></li> 
        	 	<%} else{%>
        	 	       <li><a href="ProductView.jsp">Sigarette elettroniche</a></li> 
        	 	<%} %>
          <li><a href="CartView.jsp">Carrello</a></li>
        </ul>
      </div>
    </div>
    <div class="footer-bottom">
      <p>&copy; 2023 Vaporant. Tutti i diritti riservati.</p>
    </div>
  </div>
</footer>
</body>
</html>