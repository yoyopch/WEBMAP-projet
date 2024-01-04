<!doctype html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <link href="login.css" rel="stylesheet">
    <title>Login BioLife</title>
    <link rel="stylesheet" href="../Navbar/navBarLogin.css">
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<?php include('../Navbar/navbar.php'); ?>

<div class="container-login">
    <div class="imgLogindecor">
    </div>
    <div class="flexbox-login">

        <div class="form-login">

            <div class="title-login">
                <h3>
                    Content de vous revoir !
                    <span><img src="../IMG/emojiCerice.svg"></span>
                </h3>
            </div>

            <form class="formulaire" action="login.php" method="post">
                <input name="email" type="email" placeholder="| Email"></input><br>
                <input name="password" type="password" placeholder="| Mot de passe"></input><br>
                <p class="mdp">Mot de passe oublié ?</p>
                <input type="submit" value="Connexion"><br>
                    <div class="login-ou">
                        <hr class="line">
                        <p>ou</p>
                        <hr class="line">
                    </div>
                <a href="../register/register.php"><input type="button" value="Inscription" ></a>
            </form>
        </div>
    </div>
</div>

<div id="m"> <?php echo $msg; ?> </div>


</body>
</html>
