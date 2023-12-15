<?php
	session_start();

	$email =  isset($_POST['email'])?($_POST['email']):'';
	$password =  isset($_POST['password'])?($_POST['password']):'';
	$msg = '';
	
	if  (count($_POST)==0)
	require("login.html");
    else {
		if  (!verifInfo($email,$password,$p)) {
			$msg ="Erreur de saisie OU utilisateur inconnu";
			require("login.html");
		}
		else {
			$_SESSION['profil'] = $p;
			$url = "accueil.php";
			header("Location:" . $url) ;
		}
	}	

	function verifInfo($nom,$num,&$profil = array()) {
		require('connectSQL.php');
		$sql="SELECT * FROM `utilisateur` WHERE email=:email";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':email', $nom);
			$bool = $commande->execute();
			if ($bool) {
				$resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die();
		}
		if (count($resultat) == 0) return false;
		else{
			if (password_verify($num,$resultat[0]["password"])){
				$profil = $resultat[0];
				return true;
			}else{
				return false;
			}
		}
	}

?>
