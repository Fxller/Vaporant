<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Il mio form di login</title>
    <link rel="stylesheet" type="text/css" href="loginFormStyle.css">
</head>
<body>
    <form action="loginControl" method="POST" class="form">
      <div class="title">Benvenuto</div>
      <div class="subtitle">Accedi al tuo account!</div>
      <div class="input-container ic1">
        <input id="email" class="input" type="email" name="email" placeholder=" " required>
        <div class="cut"></div>
        <label for="email" class="placeholder">Email</label>
      </div>
      <div class="input-container ic2">
        <input id="password" class="input" type="password" name="password" placeholder=" " required>
        <div class="cut cut-short"></div>
        <label for="password" class="placeholder">Password</label>
      </div>
      <div class="subtitle" align="center">
      	<h5>Non possiedi un account? <a href="SignForm.jsp"><b>Registrati!</b></a></h5>
      	<h6>oppure</h6>
      	<h5>Continua <a href="ProductView.jsp">qui</a> senza accedere</h5>
      </div>
      <input type="submit" value=Login class="submit">
<!--       <input type="submit" value="Continua senza account" class="submit"> -->
      </form>
</body>
</html>