<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	Cart cart = (Cart) request.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.Cart,it.unisa.model.ProductBean"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="CartStyle.css" rel="stylesheet" type="text/css">
	<title>YourBackPack</title>
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
    		<% 	double price=0;
    			if(cart != null) { %>
				<% List<ProductBean> prodcart = cart.getProducts(); 	
					for(ProductBean beancart: prodcart) {
						price+=beancart.getPrice();
				%>
				<tr>
					<td><%=beancart.getName()%></td>
					<td><%=beancart.getQuantity()%></td>
					<td><%=beancart.getPrice()+"€"%></td>
					<td><a href="cart?action=deleteC&id=<%=beancart.getCode()%>" class = "button buttonred">Elimina dal carrello</a></td>
				</tr>
				<% } %>
			<% } %>
    	</tbody>
  		</table>
  		<p>Totale: <span class="total-price"><%=price%></span></p>
  		<button class="checkout-btn">Checkout</button>
  		<p><a href="product" class = "button">Torna al catalogo</a></p>
	</div>
</body>
</html>