<!doctype html>
<html lang="fr">
<head>
	<meta charset="utf-8">
	<title>accueil</title>
</head>
<body>
<form action="inscription.php" method="post">
	<input name ="nom" placeholder="Name" ></input><br>
	<input name ="prenom" placeholder="Prenom" ></input><br>
	<input name	="email" type="email" placeholder="Email" ></input><br>
	<input name	="password" type="password" placeholder="Password" ></input><br>
	<input type	= "submit"  value="soumettre">
</form>
<div id ="error"> <?php echo $errormsg; ?> </div>
</body>
</html>
