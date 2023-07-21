 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    
<% 
	String action = (String) request.getSession().getAttribute("action");
   	request.getSession().setAttribute("action", action); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/9e8b7791f2.js" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="HeaderStyle.css">
<style>
	      .search-item {
			  cursor: pointer;
			}
</style>   
</head>
<body>
	<header>
		<nav class = "navbar">
		<ul>
		<li><a class = "active" href = "ProductView.jsp"><img src = "logo.png" width = 50% height = "auto"></a></li>
		<li><a href = "loginForm.jsp">Login</a></li>
		<li><a href = "CartView.jsp"><i class="fa-solid fa-cart-shopping"></i></a></li>
		<li style = "li {float:right;}">  
			<form id="searchForm">
			  <input type="text" id="searchInput" placeholder="Cerca prodotti">
			  <div id="searchResults" class="search-results"></div>
			</form>
        </li>
		</ul>
		</nav>
		<script>
		/* Funzione per mostrare/nascondere gli elementi del menu sulla navbar per dispositivi mobili */
		function toggleMenu() {
  			var x = document.querySelector(".navbar ul");
  			if (x.className === "responsive") {
    			x.className = "";
  			} else {
    			x.className = "responsive";
  			}
		}
		</script>
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
				          let html = "";
				          if (results.length > 0) {
				            for (let i = 0; i < results.length; i++) {
				              let obj = results[i];
				              html += '<div class="search-item" onclick="redirectToProduct(' + obj.ID + ')">';
				              html += '<p>' + obj.nome + '</p>';
				              html += '</div>';
				            }
				          } else {
				            html = '<div class="search-item">Nessun risultato trovato</div>';
				          }
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
		 
	</header>
</body>
</html>