<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	request.getSession();

	String user = (String) request.getSession().getAttribute("user");

	if(user == null)
		response.sendRedirect("loginForm.jsp");

	System.out.println("ciao");
	Cart cart = (Cart) request.getSession().getAttribute("cart");

	System.out.println(cart.getProducts().get(0).toString());
	System.out.println(request.getParameter("payment")); %>    


<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart"%>

<head>
<meta charset="UTF-8">
<title>Ordine</title>
</head>
<body>

</body>
</html>