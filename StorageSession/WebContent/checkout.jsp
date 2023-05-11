<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Cart cart = (Cart) request.getSession().getAttribute("cart");
	request.setAttribute("cart", cart);
	
	 	String user = null;
	if(session.getAttribute("user") == null)
	{
		request.getSession().setAttribute("action", "checkout");
		response.sendRedirect("loginForm.jsp");
	}
	else
		user = (String)session.getAttribute("user");  
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.Cart,it.unisa.model.ProductBean"%>
	<link href="CartStyle.css" rel="stylesheet" type="text/css">

<head>
<meta charset="UTF-8">
<title>Checkout</title>
</head>
<body>

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
				</tr>
				<% } %>
			<% } %>
    	</tbody>
  		</table>
  		<p>Totale: <span class="total-price"><%= cart.getPrezzoTotale()%></span></p>
		
		<form action = "ordine.jsp" method = "POST">
			<label>Paga con:</label>
				<input type="radio" id="paypal" name="payment" value="paypal">
					<label for="paypal">PayPal</label>
			<input type="radio" id="mastercard" name="payment" value="mastercard">
					<label for="mastercard">Mastercard</label>
			
  			<button class="checkout-btn" type = "submit">Acquista</button>
  		</form>
  		
	

</body>
</html>