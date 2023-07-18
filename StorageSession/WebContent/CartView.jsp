<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	Cart cart = (Cart) request.getSession().getAttribute("cart");
	request.getSession().setAttribute("cart", cart);

	String user = (String)session.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.Cart,it.unisa.model.ProductBean"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="CartStyle.css" rel="stylesheet" type="text/css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<title>Vaporant Cart</title>
	<style>
h1 {
	text-align: center;
}

.cart {
	width: 90%;
	display: flex;
	margin: 0 auto;
}

.products {
	width: 70%;
	display: flex;
	overflow: hidden;
	transition: all .6s ease;
}

.products:hover {
	transform: scale(1.02);
}

.payment {
	width: 30%;
}

p {
	margin-bottom: 0;
}

table {
	border-collapse: collapse; 
}
	</style>
</head>
<body>
	<jsp:include page="Header.jsp" />

	<h1>CARRELLO</h1>
	
	<div class = "cart">
		<div class = "products">
			<div class = "box">
				<img src = "img1.jpg" alt = "">
				<div class = "details">
					Nome prodotto
					Prezzo
					
				</div>
			</div>
		</div>
		<div class = "payment">
			<p><span>Prezzo dei prodotti:</span> 100$ </p>
			<p><span>Costo di spedizione:</span> 10$ </p>
			<hr>
			<p><span>Totale:</span> 110$ </p>
		</div>
	</div>
	
	<jsp:include page="Footer.jsp" />
</body>
</html>	