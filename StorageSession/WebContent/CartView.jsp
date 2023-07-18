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
	<title>Vaporant Cart</title>
	<style>
body {
	background-color: white;
}
	
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.wrapper {
	margin: 0 auto;
	max-width: 90%;
}
.wrapper h1 {
	padding : 1%;
	text-align: center;
	text-transform: uppercase;
}
.project {
	display: flex;
}
.shop {
	flex: 75%;
}
.box {
	display: flex;
	width: 100%;
	height: 20%;
	overflow: hidden;
	margin-bottom: 1%;
	background: #fff;
	transition: all .6s ease;
	box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
	border-radius: 1%;
}
.box:hover {
	border: none;
	transform: scale(1.01);
}
.box img {
	width: 50%;
	height: 100%;
	object-fit: contain;
}
.content {
	padding: 3%;
	width: 100%;
	position: relative;
}
.content h3 {
	margin-bottom: 2%;
}
.content h4 {
	margin-bottom: 8%;
}
.btn-area {
	position: absolute;
	bottom: 5%;
	right: 3%;
	padding: 1% 2%;
	background-color: black;
	color: white;
	cursor: pointer;
	border-radius: 5%;
}
.btn-area:hover {
	background-color: red;
	color: #fff;
	font-weight: bold;
}
.unit input {
	width: 5%;
	padding: 0;
	text-align: center;
}

.right-bar {
	flex: 25%;
	margin-left: 2%;
	padding: 2%;
	height: 1%;
	border-radius: 3%;
	background: #fff;
	box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
}
.right-bar hr {
	margin-bottom: 7%;
}
.right-bar p {
	display: flex;
	justify-content: space-between;
	margin-bottom: 10%;
	font-size: 20px;
}
.right-bar a {
	background-color: black;
	color: #fff;
	text-decoration: none;
	display: block;
	text-align: center;
	line-height: 40px;
	font-weight: bold;
}
.right-bar i {
	margin-right: 3%;
}
.right-bar a:hover {
	background-color: #76bfb6;
}
@media screen and (max-width: 700px) {
	.content h3 {
		margin-bottom: 15px;
	}
	.content h4 {
		margin-bottom: 20px;
	}
	.btn2 {
		display: none;
	}
	.box {
		height: 150px;
	}
	.box img {
		height: 150px;
		width: 200px;
	}
}
@media screen and (max-width: 900px) {
	.project {
		flex-direction: column;
	}
	.right-bar {
		margin-left: 0;
		margin-bottom: 20px;
	}
}
@media screen and (max-width: 1250px) {
	.wrapper {
		max-width: 95%;
	}
}
	</style>
</head>
<body>
	<jsp:include page="Header.jsp" />

    <div class="wrapper">
		<h1>Shopping Cart</h1>
		<div class="project">
			<div class="shop">
				<div class="box">
					<img src="img1.jpg">
					<div class="content">
						<h3>Women Lipsticks</h3>
						<h4>Price: $40</h4>
						<p class="unit">Quantity: <input name="" value="2"></p>
						<p class="btn-area"><i aria-hidden="true" class="fa fa-trash"></i> <span class="btn2">Remove</span></p>
					</div>
				</div>
				<div class="box">
					<img src="img2.jpg">
					<div class="content">
						<h3>Man's Watches</h3>
						<h4>Price: $40</h4>
						<p class="unit">Quantity: <input name="" value="1"></p>
						<p class="btn-area"><i aria-hidden="true" class="fa fa-trash"></i> <span class="btn2">Remove</span></p>
					</div>
				</div>
				<div class="box">
					<img src="img3.jpg">
					<div class="content">
						<h3>Samsung Mobile</h3>
						<h4>Price: $250</h4>
						<p class="unit">Quantity: <input name="" value="0"></p>
						<p class="btn-area"><i aria-hidden="true" class="fa fa-trash"></i> <span class="btn2">Remove</span></p>
					</div>
				</div>
			</div>
			<div class="right-bar">
				<p><span>Prezzo articoli</span> <span>$120</span></p>
				<hr>
				<p><span>Spedizione</span> <span>Gratuita</span></p>
				<hr>
				<p><span>Totale</span> <span>$141</span></p><a href="#"><i class="fa fa-shopping-cart"></i>Checkout</a>
			</div>
		</div>
	</div>
	<jsp:include page="Footer.jsp" />
</body>
</html>	