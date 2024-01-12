<?php
$nom =  isset($_POST['nom'])?($_POST['nom']):'';
$prenom =  isset($_POST['prenom'])?($_POST['prenom']):'';
$email =  isset($_POST['email'])?($_POST['email']):'';
$phone =  isset($_POST['phone'])?($_POST['phone']):'';
$password =  isset($_POST['password'])?($_POST['password']):'';
$passwordTwo  = isset($_POST['checkpassword'])?($_POST['checkpassword']):'';
$errormsg = "";

if  (count($_POST)==0)
    require('register.tpl');
else {
    if (checkpassword($password,$passwordTwo)) {
        if (checkPhone($phone)) {
            if (!checkmail($email)) {
                inscription($nom, $prenom, $email, $phone, $password);
            }
        }
    }
}

function inscription($n, $prenomm, $emails, $p, $ps){
    $newphone = "+33".$p;
    $hashedPassword = password_hash($ps, PASSWORD_DEFAULT);

    require('../connectSQL.php');
    $sql = "INSERT INTO utilisateur (nom, prenom, email, phone, password) VALUES (:nom, :prenom, :email, :phone, :password)";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':nom', $n);
        $commande->bindParam(':prenom', $prenomm);
        $commande->bindParam(':email', $emails);
        $commande->bindParam(':phone', $newphone);
        $commande->bindParam(':password',  $hashedPassword);

        $bool = $commande->execute();
        if ($bool) {
            $url = "../login/login.php";
            header("Location:" . $url) ;
            exit();
        }
    }
    catch (PDOException $e) {
        echo utf8_encode("Echec de l'insertion : " . $e->getMessage() . "\n");
        die();
    }
}

function checkmail($email){
    require('../connectSQL.php');
    $sql="SELECT * FROM `utilisateur` WHERE email=:email";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':email', $email);
        $bool = $commande->execute();
        if ($bool) {
            $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
        }
    }
    catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
        die();
    }
    if (count($resultat) == 0)
        return false;
    else{
        error("email déjà utilisé !");
        return true;
    }
}

function checkpassword($password,$passwordTwo){
    $passwordSize = 8;

    if (regexMdp($password)) {
        if ($password != $passwordTwo) { return error("Il faut entrer les mêmes mdp !");}
        if (strlen($password) >= $passwordSize) {
            return true;
        } else {
            error("Un mot de passe sup à $passwordSize");
        }
    }
    return false;
}

function checkPhone($phone){
    if (preg_match('/^([0-9]{9,15})$/', $phone)){
        return true;
    }else{
        error("Numero de phone pas suffisant");
        return false;
    }
}

function error($message){
    $errormsg = $message;
    require("register.tpl");
}
function regexMdp($mot){
    if (preg_match('/^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@#$%^&!*_])[A-Za-z\d@#$%^&!*_]{8,}$/', $mot)){
        return true;
    }else{
        error("Mot de passe Incomplet il faut au moins un chiffre et un caractere sépcial !");
        return false;
    }
}

?>

