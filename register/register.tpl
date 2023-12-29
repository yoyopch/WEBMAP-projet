<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Inscription</title>
    <link rel="stylesheet" href="../register/register.css">

    <link rel="stylesheet" href="../Navbar/navbarRegister.css">
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>
<?php include('../Navbar/navbar.php'); ?>

<div class="logDiv">
    <h1>
        Inscrivez-vous !
        <span><img src="../IMG/emojiCerice.svg"></span>
    </h1>

    <form action="register.php" method="post">
        <div class="container_inscription">
            <h2>
                Nom complet
            </h2>
            <div class="nom">
                <input name="prenom" placeholder="Prénom"></input>
                <input name="nom" placeholder="Nom"></input>
            </div>

            <h2>
                Email
            </h2>
            <input name="email" type="email" placeholder="Email"></input>


            <h2>
                Mot de passe
            </h2>
            <div class="password">
                <input name="password" type="password" placeholder="Mot de passe"></input>
                <input name="checkpassword" type="password" placeholder="Confirmez votre mot de passe"></input>
            </div>

            <h2>
                Numéro de téléphone
            </h2>
            <input name="phone" type="phone" placeholder="+33" value=""></input>
            <div id="error"> <?php echo $errormsg; ?> </div>
            <input type="submit" value="Soumettre"></input>
        </div>
    </form>
</div>

</body>
</html>
