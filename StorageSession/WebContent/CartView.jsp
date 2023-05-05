<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	Cart cart = (Cart) request.getSession().getAttribute("cart");

	String user = null;
	if(session.getAttribute("user") == null)
		response.sendRedirect("loginForm.jsp");
	else
		user = (String)session.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.Cart,it.unisa.model.ProductBean"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="CartStyle.css" rel="stylesheet" type="text/css">
	<title>YourBeckPeck</title>

</head>
<body>
	<div id="cart">
  		<h2>Carrello</h2>
  		<table>
    	<thead>
      		<tr>
        		<th>Prodotto</th>
        		<th>Quantità</th>
        		<th>Prezzo</th>
        		<th></th>
      		</tr>
    	</thead>
    	<tbody>
    		<% 	if(cart != null) { %>
				<% List<ProductBean> prodcart = cart.getProducts(); 	
					for(ProductBean beancart : prodcart) {
				%>
				<tr>
					<td><%=beancart.getName()%></td>
					<td>
					<form action = "cart?action=aggiorna&id=<%=beancart.getCode()%>" method = "POST" >
						<input type = "number" name = "quantita" value = "<%=beancart.getQuantity()%>" required min = "1" max = "<%=beancart.getQuantityStorage()%>" >
						<button class = "checkout-btn" type = "submit">Aggiorna</button>
		
					</form>
					</td>
					
					<td><%=beancart.getPrice()+"€"%></td>
					<td><a href="cart?action=deleteC&id=<%=beancart.getCode()%>" class = "button buttonred">Elimina dal carrello</a></td>
				</tr>
				<% } %>
			<% } %>
    	</tbody>
  		</table>
  		<p>Totale: <span class="total-price"><%= cart.getPrezzoTotale()%></span></p>
  		<button class="checkout-btn">Checkout</button>
  		<p><a href="product?user=${user}" class = "button">Torna al catalogo</a></p>
	</div>
</body>
</html>