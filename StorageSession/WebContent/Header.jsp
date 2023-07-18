<!DOCTYPE html>
<html>
<head>
	<link href = "HeaderStyle.css" rel = "stylesheet" type = "text/css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<nav>
		<div class = "logo">
			<a href = "product"><img src = "logo.png" class = "logosite"></a>
		</div>
		<div class = "links">
			<a href = "loginForm.jsp">Login</a>
		</div>
		<div class = "search">
			<div class = "kek">
				<form method = "POST" action = "search">
					<input type = "text" class = "border">
					<button type = "submit" value = "search">
					<span class="material-symbols-outlined">
						search
					</span>
					</button>
				</form>
			</div>
		</div>
	</nav>
</body>
</html>