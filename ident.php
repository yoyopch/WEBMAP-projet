<?php
	session_start();

	$email =  isset($_POST['email'])?($_POST['email']):'';
	$password =  isset($_POST['password'])?($_POST['password']):'';
	$msg = '';
	
	if  (count($_POST)==0)
	require ("ident.tpl") ;
    else {
		if  (!verif_identV3($email,$password,$p)) {
			$msg ="Erreur de saisie OU utilisateur inconnu";
			require ("ident.tpl") ;
		}
		else {
			$_SESSION['profil'] = $p;
			$url = "accueil.php";
			header("Location:" . $url) ;
		}
	}	

	function verif_identV3($nom,$num,&$profil = array()) {
		require('connectSQL.php');
		$sql="SELECT * FROM `utilisateur` WHERE email=:email";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':email', $nom);
			$bool = $commande->execute();
			if ($bool) {
				$resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
				//var_dump($num,$resultat[0]['password']);
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
