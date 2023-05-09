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
      <input type="submit" value=Login class="submit">
      </form>
</body>
</html>