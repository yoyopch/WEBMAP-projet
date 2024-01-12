<?php
	session_start();
    $_SESSION['profil']['isConnected'] = false;

	$email =  isset($_POST['email'])?($_POST['email']):'';
	$password =  isset($_POST['password'])?($_POST['password']):'';
	$msg = '';
	
	if  (count($_POST)==0)
	require("../login/login.tpl");
    else {
		if  (!verifInfo($email,$password,$p)) {
			$msg ="Erreur de saisie OU utilisateur inconnu";
			require("../login/login.tpl");
		}
		else {
			$_SESSION['profil'] = $p;
            error_log(print_r($p,true));
			$url = "../Magasins/magasins.php";
			header("Location:" . $url) ;
            $_SESSION['profil']['isConnected'] = true;

        }
	}	

	function verifInfo($nom,$num,&$profil = array()) {
		require('../connectSQL.php');
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


