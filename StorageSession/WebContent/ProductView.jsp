<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./product");	
		return;
	}
	ProductBean product = (ProductBean) request.getAttribute("product");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
	<title>Vaporant Manager</title>
</head>

<body>
	<h2>Prodotti <a href="cart">🛒</a></h2>
	<table border = "1">
		<tr>
            <th>Codice <a href="product?action=sort&sort=id" class = "button">Sort</a></th>
            <th>Nome <a href="product?action=sort&sort=nome" class = "button">Sort</a></th>
            <th>Immagine </th>
            <th>Descrizione <a href="product?action=sort&sort=descrizione" class = "button">Sort</a></th>
            <th>Quantita'</th>
            <th>Azione</th>
        </tr>
		<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ProductBean bean = (ProductBean) it.next();
		%>
		<tr>
			<td><%=bean.getCode()%></td>
			<td><%=bean.getName()%></td>
			<td><img src = "img<%=bean.getCode()%>.jpg" width = 20%></td>
			<td><%=bean.getDescription()%></td>
			<td><%=bean.getQuantity()%></td>
			<td>
				<a href="product?action=delete&id=<%=bean.getCode()%>" class = "button button3">Delete</a>
				<a href="details?action=read&id=<%=bean.getCode()%>" class = "button button2">Details</a>
				<a href="cart?action=addC&id=<%=bean.getCode()%>" class = "button button1">Add to cart</a>
			</td>
		</tr>
		<%
				}
			} else {
		%>
		<tr>
			<td colspan="5">No products available</td>
		</tr>
		<%
			}
		%>
	</table>

	<form action="product" method="post">
	
	<br><br>
	
		<fieldset>
		<legend> Inserimento di un prodotto </legend>
		<input type="hidden" name="action" value="insert"> 
		
		<label for="name">Nome:</label> 
		<input name="name" type="text" maxlength="20" required placeholder="Nome del prodotto.."><br> 
		
		<div class = "formfield">
		<label for="description">Descrizione:</label>
		<textarea name="description" maxlength="100" rows="3" required placeholder="Descrizione del prodoto.."></textarea><br>
		</div>
		
		<label for="price">Prezzo:</label>
		<input name="price" type="number" min="0" value="0" required><br>

		<label for="quantity">Quantità:</label> 
		<input name="quantity" type="number" min="1" value="1" required><br>
		
		<label for="type">Tipo:</label>
        <input name="type" type="text" maxlength="40" required placeholder="enter type"><br>
		
		
		<br>
		
		<input type="submit" value="Add" class = "buttonform button1">
		<input type="reset" value="Reset" class = "buttonform button2">
		</fieldset>
	</form>	
	<br><br>
</body>
</html>