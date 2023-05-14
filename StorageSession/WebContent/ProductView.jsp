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
	
	if(user != null){ 
			request.getSession().setAttribute("action", "logout");
		}
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
	<jsp:include page="Header.jsp" />
<br>
	<%if(user!=null){%>
	    <form action="logoutControl" method="POST" class="form">
			<button type="submit"><i class="fa-solid fa-right-from-bracket fa-rotate-180"></i></button>
		</form>
	<% } %>
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
				<a href="details?action=read&id=<%=bean.getCode()%>" class = "button button2">Dettagli</a>
				<a href="cart?action=addC&id=<%=bean.getCode()%>&user=${user}" class = "button button1">Aggiungi al carrello</a>
			</td>
		</tr>
		<%
				}
			} else {
		%>
		<tr>
			<td colspan="5">Non ci sono prodotti disponibili</td>
		</tr>
		<%
			}
		%>
	</table>
	<jsp:include page="Footer.jsp" />
</body>
</html>