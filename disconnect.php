<?php
session_start();

$_SESSION['profil']['isConnected'] = false;

$url = "Magasins/magasins.php";
header("Location:" . $url) ;
exit();