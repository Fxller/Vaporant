<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	String action = (String)request.getSession().getAttribute("action");
	
%>
	
<!DOCTYPE html>
<html>
<head>
    <title>Il mio form di login</title>
    <link rel="stylesheet" type="text/css" href="loginFormStyle.css">
</head>
<body>
    <h1>Benvenuto</h1>
    <form action="loginControl" method="POST">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" placeholder="Inserisci la tua email" required>
        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Inserisci la tua password" required>
        <input type="submit" value=Login>
    </form>
</body>
</html>
