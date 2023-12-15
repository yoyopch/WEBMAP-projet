<?php
session_start();

$nom = 	isset($_SESSION['profil']["nom"])?(strtoupper($_SESSION['profil']["nom"])):'';

if (!empty($_SESSION['profil'])) {
    require("accueil.tpl");
}