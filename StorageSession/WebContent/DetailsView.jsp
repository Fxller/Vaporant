<%
    ProductBean product = (ProductBean) request.getAttribute("product");
%>

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
      <div class="left-column">
        <img src="img<%=product.getCode()%>.jpg" alt="">
      </div>

      <div class="right-column">

        <div class="product-description">
          <h1><%=product.getName()%></h1>
          <p><%=product.getDescription()%></p>
        </div>

        <div class="product-price">
          <span><%=product.getPrice()%>€</span>
          <a href="cart?action=addC&id=<%=product.getCode()%>&user=${user}" class="cart-btn">Aggiungi al carrello</a>
        </div>
      </div>
    </main>
    
	<jsp:include page="Footer.jsp" />
</body>
</html>