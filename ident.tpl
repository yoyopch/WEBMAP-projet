<!doctype html>
<html lang="fr">

	<head>
		<meta charset="utf-8">
		<title>identification</title>
	</head>

	<body>
		<h3> Formulaire d'authentification </h3>

		<form action="ident.php" method="post">
			<input name	="email" type="email" placeholder="Email" ></input><br>
			<input name	="password" type="password" placeholder="Password" ></input><br>
			<input type	= "submit"  value="soumettre">
		</form>

		<div id ="m"> <?php echo $msg; ?> </div>
	</body>
</html>
