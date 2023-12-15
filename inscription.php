<?php
$nom =  isset($_POST['nom'])?($_POST['nom']):'';
$prenom =  isset($_POST['prenom'])?($_POST['prenom']):'';
$email =  isset($_POST['email'])?($_POST['email']):'';
$password =  isset($_POST['password'])?($_POST['password']):'';
$errormsg = "";

if  (count($_POST)==0)
    require ("inscription.tpl") ;
else {
    if (checkpassword($password)) {
        if (!checkmail($email)){
            incription($nom, $prenom, $email, $password);
        }
    }
}

function incription($nom,$prenom,$email,$password){
    require('connectSQL.php');
    $sql = "INSERT INTO utilisateur (nom, prenom, email, password) VALUES (:nom, :prenom, :email,:password)";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':nom', $nom);
        $commande->bindParam(':prenom', $prenom);
        $commande->bindParam(':email', $email);
        $commande->bindParam(':password',  password_hash($password, PASSWORD_DEFAULT));

        $bool = $commande->execute();
        if ($bool) {
            $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
            require("ident.tpl");
        }
    }
    catch (PDOException $e) {
        echo utf8_encode("Echec de l'insertion : " . $e->getMessage() . "\n");
        die();
    }
}

function checkmail($email){
    require('connectSQL.php');
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
        error("email déjà utiliser !");
        return true;
    }
}

function checkpassword($password){
    $passwordSize = 8;

    if (regex($password)) {
        if (strlen($password) >= $passwordSize) {
            var_dump(strlen($password));
            return true;
        } else {
            error("Un mot de passe sup à $passwordSize");
        }
    }
    return false;
}
function error($message){
    $errormsg = $message;
    require ("inscription.tpl");
}
function regex($mot){
    if (preg_match('/^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@#$%^&!*_])[A-Za-z\d@#$%^&!*_]{8,}$/', $mot)){
        return true;
    }else{
        error("Mot de passe Incomplet il faut au moins un chiffre et un caractere sépcial !");
        return false;
    }
}
?>