<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "it.unisa.model.OrderBean,it.unisa.model.UserBean" %>
    
    
<%	request.getSession();

	UserBean user = (UserBean) request.getSession().getAttribute("user");

	if(user.getEmail() == null)
		response.sendRedirect("loginForm.jsp");

	OrderBean order = (OrderBean) request.getSession().getAttribute("order"); 
	
	Cart cart = (Cart)request.getSession().getAttribute("cart");
	
%>    


<!DOCTYPE html>
<html>
	<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart"%>

<head>
	<meta charset="UTF-8">
	<title>Ordine</title>
    <link rel="stylesheet" type="text/css" href="OrdineStyle.css">
</head>
<body>
	<jsp:include page="Header.jsp" />
	<h1><span>Acquisto effettuato!</span></h1>
	<div class = "resoconto">
	<% 	
		for(ProductBean beancart : cart.getProducts()) {
	%>
	<table>
        	<thead>        
            	<tr>
                	<th>Prodotto</th>
                	<th>Quantità</th>
                	<th>Prezzo</th>
            	</tr>
        	</thead>
			<tbody>
				<tr>
					<td><span><%=beancart.getName()%></span></td>
					<td>
						<%=beancart.getQuantity()%>
					</td>
					<td><%=beancart.getPrice()+"€"%></td>
				</tr>
			</tbody>
		</table>
	<% } %>
	<form action = "fattura" method = "Post">
		<button type = "submit" class = "btn">SCARICA QUI LA TUA FATTURA</button>
	</form>
	</div>
	
	<jsp:include page="Footer.jsp" />
</body>

</html>