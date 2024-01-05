<?php
session_start();

$nom = 	isset($_SESSION['profil']["nom"])?(strtoupper($_SESSION['profil']["nom"])):'';

    require("accueil.tpl");
