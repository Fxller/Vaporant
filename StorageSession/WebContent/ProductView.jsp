<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.getSession().setAttribute("tipo", "guest");
	
	Collection<?> products = (Collection<?>) session.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./product");	
		return;
	}
	ProductBean product = (ProductBean) session.getAttribute("product");
	String user = (String) request.getSession().getAttribute("user");

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
	<h2>Prodotti <a href="cart">🛒</a></h2><a href = "loginForm.jsp">login</a><a href = "SignForm.jsp">   Sign in</a>
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
			<td><%=bean.getQuantityStorage()%></td>
			<td>
				<a href="product?action=delete&id=<%=bean.getCode()%>" class = "button button3">Delete</a>
				<a href="details?action=read&id=<%=bean.getCode()%>" class = "button button2">Details</a>
				<a href="cart?action=addC&id=<%=bean.getCode()%>&user=${user}" class = "button button1">Add to cart</a>
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
	
</body>
</html>