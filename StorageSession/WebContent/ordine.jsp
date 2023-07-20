<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "it.unisa.model.OrderBean,it.unisa.model.UserBean" %>
    
    
<%	request.getSession();

	UserBean user = (UserBean) request.getSession().getAttribute("user");

	if(user.getEmail() == null)
		response.sendRedirect("loginForm.jsp");

	OrderBean order = (OrderBean) request.getSession().getAttribute("order"); 
    @SuppressWarnings("unchecked")
	List<ProductBean> listaProdotti = (List<ProductBean>) request.getSession().getAttribute("listaProd");
	request.getSession().removeAttribute("cart");
	
%>    


<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart"%>

<head>
<meta charset="UTF-8">
<title>Ordine</title>
</head>
<body>
	Acquisto effettuato<br>
	Torna alla <a href="ProductView.jsp">HOME</a>

	<form action = "fattura" method = "Post">
		<button type = submit >fattura</button>
	</form>

</body>

</html>