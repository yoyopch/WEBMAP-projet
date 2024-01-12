<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Profil</title>
    <link rel="stylesheet" href="profil.css">
    <link rel="stylesheet" href="../Navbar/navbar.css">
    <script src="profil.js"></script>

</head>

<?php include('../Navbar/navbar.php'); ?>

<body>
<div class="blank">
    <div class="titleProfil">
        <h1>Bienvenue sur votre profil !</h1>
    </div>
    <div class="infos_profil">
        <div class="photo_profil"> <img src="../IMG/Profil/pp.jpg" style="border-radius: 50%; width: 125px; height: 125px"></div>
        <div class="nom">
            <h3>Nom : <?php echo($_SESSION['profil']['nom'])?> <br>Prénom : <?php echo($_SESSION['profil']['prenom'])?></h3>
            <p>Ici, vous pouvez consulter vos commandes !</p>
        </div>
    </div>
    <div class="block_commande">
        <div class="txt_titre_commande">
            <p>Vos commandes :</p>
        </div>
        <div class="txt_commande"<p>Commandes en cours :</p></div>
    <div class="etat_commande">
    </div>

</div>

</div>






</div>




</body>
</html>