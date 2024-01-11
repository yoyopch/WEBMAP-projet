<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Profil</title>
    <link rel="stylesheet" href="profil.css">
    <link rel="stylesheet" href="../Navbar/navbar.css">

</head>

<?php include('../Navbar/navbar.php'); ?>

<body>
<div class="blank">
    <div class="infos_profil">
        <div class="photo_profil"> <img src="../IMG/Profil/pp.jpg" style="border-radius: 50%; width: 75%; height: 100%"></div>
        <div class="nom"><p>Nom : <?php echo($_SESSION['profil']['nom'])?> <br>Prénom : <?php echo($_SESSION['profil']['prenom'])?></p></div>
    </div>
    <div class="txt_titre_commande"<p>COMMANDES :</p></div>
<div class="block_commande">
    <div class="txt_commande"<p>En cours</p></div>

    <div class="etat_commande">
        <div class="block_voir_commande">
            <div class="txt_etat"><p>ID#1</p></div>
            <input type="button" value="Voir la commande">
        </div>
    </div>

    <div class="txt_commande"<p>Terminées</p></div>
    <div class="etat_commande">
        <div class="block_voir_commande">
            <div class="txt_etat"><p>ID#1</p></div>
            <input type="button" value="Voir la commande">
        </div>
</div>

</div>






</div>




</body>
</html>