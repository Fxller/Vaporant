<%@page import="it.unisa.model.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<% 
	String action = (String) request.getSession().getAttribute("action");
   	request.getSession().setAttribute("action", action);
%>
<!DOCTYPE html>
<html>
<head>
	<link href = "HeaderStyle.css" rel = "stylesheet" type = "text/css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<style>
          .search-item {
              cursor: pointer;
            }
	</style>
</head>
<body>
	<nav>
		<div class = "logo">
			<a href = "product"><img src = "logo.png" class = "logosite"></a>
		</div>
		<%if(session.getAttribute("user") != null){ %>
			<div class = "links">
			<a href = "logoutControl">Logout</a>
			</div>
			<div class = "links">
			<a href = "Utente.jsp">Profilo</a>
			</div>
		<%}else{%>
			<div class = "links">
			<a href = "loginForm.jsp">Login</a>
			</div>
		<%}%>
		<div class = "links">
			<a href = "CartView.jsp">Carrello</a>
		</div>
		<div class = "search">
			<div class = "kek">
				<form id="searchForm">
					<input type = "text" id="searchInput" class = "border" placeholder="Cerca">
				</form>
			</div>
		</div>
		
	</nav>
	<br><div id="searchResults" class="search-results"></div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     <script>
        $(document).ready(function() {
          let searchInput = $("#searchInput");
          let searchResults = $("#searchResults");
        
          searchInput.on("input", function() {
            let searchQuery = searchInput.val().trim();
            if (searchQuery !== "") {
              $.ajax({
                url: "SearchBar", // Inserisci il percorso della tua servlet
                type: "POST",
                data: { nome: searchQuery, descrizione: searchQuery },
                success: function(data) {
                    let results = data;
                    let html = '<table class="search-table">';
                    if (results.length > 0) {
                        for (let i = 0; i < results.length; i++) {
                            let obj = results[i];
                            html += '<tr class="search-item" onclick="redirectToProduct(' + obj.ID + ')">';
                            html += '<td> -> ' + obj.nome + '</td>';
                            // Puoi aggiungere altre colonne della tabella qui, se necessario
                            html += '</tr>';
                        }
                    } else {
                        html += '<tr class="search-item"><td colspan="2">Nessun risultato trovato</td></tr>';
                    }
                    html += '</table>';
                    searchResults.html(html);
                    searchResults.show();
                },

                error: function() {
                  console.log("errore");
                }
              });
            } else {
              searchResults.html("");
              searchResults.hide();
            }
          });
        });
        
        function redirectToProduct(productId) {
          window.location.href = "details?action=read&id=" + productId; // Inserisci l'URL della pagina di descrizione del prodotto
          
        }
  </script>
</body>
</html>