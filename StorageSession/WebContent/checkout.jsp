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

	<div class="form">
		<h1 class="title">Checkout</h1>

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
				<% if(cart != null) { %>
					<% List<ProductBean> prodcart = cart.getProducts(); 	
						for(ProductBean beancart : prodcart) {
					%>
					<tr>
						<td><%=beancart.getName()%></td>
						<td>
							<form action="cart?action=aggiornaCheck&id=<%=beancart.getCode()%>" method="POST">
								<div class="input-container ic1">
									<input type="number" id="quantita" name="quantita" value="<%=beancart.getQuantity()%>" required min="1" max="<%=beancart.getQuantityStorage()%>">
									<label for="quantita" class="placeholder">Quantità</label>
									<div class="cut"></div>
								</div>
								<button class="checkout-btn" type="submit">Aggiorna</button>
							</form>
						</td>
						<td><%=beancart.getPrice()+"€"%></td>
					</tr>
					<% } %>
				<% } %>
			</tbody>
		</table>

		<p>Totale: <span class="total-price"><%= cart.getPrezzoTotale()%></span></p>

		<form action="Ordine" method="POST">
			<div class="input-container ic2">
				<select id="addressDropdown" name="addressDropdown" required>
					<option value="">Seleziona un indirizzo</option>
				</select>
				<label for="addressDropdown" class="placeholder">Indirizzo di spedizione</label>
				<div class="cut cut-short"></div>
			</div>
			
			<div class="input-container ic2">
				<select id="addressDropdown2" name="addressDropdown2" required>
					<option value="">Seleziona un indirizzo</option>
				</select>
				<label for="addressDropdown2" class="placeholder">Indirizzo di fatturazione</label>
				<div class="cut cut-short"></div>
			</div>
			
			<a href="AddressForm.jsp">Aggiungi indirizzo</a>
			<div>
				<label>Paga con:</label>
				<div>
					<input type="radio" id="PayPal" name="payment" required value="PayPal">
					<label for="paypal">PayPal</label>
				</div>
				<div>
					<input type="radio" id="Carta di credito/debito" name="payment" required value="Carta di credito/debito">
					<label for="mastercard">Carta di credito/debito</label>
				</div>
			</div>
			<button class="checkout-btn" type="submit">Acquista</button>
		</form>

	</div>

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
		
		const addressOptions2 = addresses.map(address => ({
			id: address.id,
			label: address.indirizzo
		}));
		
		const dropdown2 = document.getElementById("addressDropdown2");
		addressOptions.forEach(address => {
			const option2 = document.createElement("option");
			option2.value = address.label;
  			option2.textContent = address.label;
  			dropdown2.appendChild(option2); 
		});
	
</script>

</body>

</html>