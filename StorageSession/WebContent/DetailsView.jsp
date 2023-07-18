<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="DetailsStyle.css" rel="stylesheet" type="text/css">
	<title>Pagina del prodotto</title>
</head>
<body>
	<jsp:include page="Header.jsp" />
	
	<main class="product-container">
      <!-- Left Column / Headphones Image -->
      <div class="left-column">
        <img src="img1.jpg" alt="">
      </div>

      <!-- Right Column -->
      <div class="right-column">

        <!-- Product Description -->
        <div class="product-description">
          <h1>Beats EP</h1>
          <p>The preferred choice of a vast range of acclaimed DJs. Punchy, bass-focused sound and high isolation. Sturdy headband and on-ear cushions suitable for live performance</p>
        </div>

        <!-- Product Pricing -->
        <div class="product-price">
          <span>148$</span>
          <a href="CartView.jsp" class="cart-btn">Add to cart</a>
        </div>
      </div>
    </main>
    
	<jsp:include page="Footer.jsp" />
</body>
</html>