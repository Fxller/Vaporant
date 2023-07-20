<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "it.unisa.model.AddressScript"%>
   
<%@ page import="com.google.gson.Gson" %>


<%
	
	Cart cart = (Cart) request.getSession().getAttribute("cart");
	request.setAttribute("cart", cart);
	
	UserBean user = null;
	String json = null;
	 
	AddressList list = null;
	 
	if(session.getAttribute("user") == null)
	{
		request.getSession().setAttribute("action", "checkout");
		response.sendRedirect("loginForm.jsp");
	}
	else
	{
		user = (UserBean) session.getAttribute("user");  
		
	    list = new AddressList(user);
	    json = list.getJson();
	}
	
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.Cart,it.unisa.model.ProductBean, it.unisa.model.AddressList,it.unisa.model.UserBean"%>

	<link href="checkoutStyle.css" rel="stylesheet" type="text/css">

<head>

<meta charset="UTF-8">
<title>Checkout</title>

</head>
<body>
	<jsp:include page="Header.jsp" />
        <h1>checkout</h1>
        <table>
        	<thead>        
            	<tr>
                	<th>Prodotto</th>
                	<th>Quantità</th>
                	<th>Prezzo</th>
            	</tr>
        	</thead>
			<tbody>
				<% if(cart != null) { %>
					<% List<ProductBean> prodcart = cart.getProducts(); 	
						for(ProductBean beancart : prodcart) {
					%>
					<tr>
						<td><h1><%=beancart.getName()%></h1></td>
						<td>
							<form action="cart?action=aggiornaCheck&id=<%=beancart.getCode()%>" method="POST" class = "update">
									<input type="number" id="quantita" name="quantita" value="<%=beancart.getQuantity()%>" required min="1" max="<%=beancart.getQuantityStorage()%>">
								<button class="checkout-btn" type="submit">Aggiorna</button>
							</form>
						</td>
						<td><%=beancart.getPrice()+"€"%></td>
					</tr>
					<% } %>
				<% } %>
			</tbody>
		</table>

		<span>Totale: <%= cart.getPrezzoTotale()%>£</span>

		<form action="Ordine" method="POST" class = "none">
			<div class="dropdown">
				<label for="addressDropdown" class="placeholder">Indirizzo di spedizione: </label>
					<select id="addressDropdown" name="addressDropdown" required>
						<option value="">Seleziona un indirizzo</option>
					</select>
			</div>
			<div class = "add">
			<a href="AddressForm.jsp">Aggiungi indirizzo..</a>
			</div>
			<span>Paga con:</span>
			<br><br>
				<div class = "radio">
					<input type="radio" id="paypal" name="payment" required value="PayPal">
					<label for="paypal">PayPal</label>
				</div>
				<div class = "radio">
					<input type="radio" id="mastercard" name="payment" required value="Mastercard">
					<label for="mastercard">Mastercard</label>
				</div>
			 <div class = "checkout">
				<button class="checkout-btn" type="submit">Acquista</button>
			 </div>
		</form>
	<script>
		const jsonString = '<%= json %>';

		const addresses = JSON.parse(jsonString);

		const addressOptions = addresses.map(address => ({
			id: address.id,
			label: address.indirizzo
		}));
		const dropdown = document.getElementById("addressDropdown");
		addressOptions.forEach(address => {
			const option = document.createElement("option");
			option.value = address.id;
  			option.textContent = address.label;
  			dropdown.appendChild(option); 
		});
	
	</script>
	<jsp:include page="Footer.jsp" />
</body>

</html>