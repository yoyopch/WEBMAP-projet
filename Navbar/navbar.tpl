<!doctype html>
<html lang="fr">

<head>
    <meta charset="utf-8">
    <title>BioLife</title>

    <!--Link CSS-->
    <link href="../Navbar/navbar.css" rel="stylesheet">


    <!--Link JS-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
            crossorigin="anonymous"></script>

    <!--Link Boostrap-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="../Navbar/navbar.js"></script>

</head>

<body>

<!--<p class="userName"> <?php /*echo($nom) */?> </p>-->


<!--bootstrap Navbar-->
<nav class="navbar ">
    <div class="container-fluid">
        <a class="navbar-brand" href="../Magasins/magasins.php"> <img src="../IMG/logo-site.svg"> </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasNavbarLabel">BioLife <span> <img src="../IMG/logo-site.svg"></span> </h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="../Magasins/magasins.php">Magasins</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Produits</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../discover/discover.php">Découvrir le bio</a>
                    </li>
                </ul>
                <h5 id="welcome">Bienvenue : <?php echo(isset($_SESSION['profil']['nom']) ? $_SESSION['profil']['nom'] : '') . ' ' . (isset($_SESSION['profil']['prenom']) ? $_SESSION['profil']['prenom'] : '') ?></h5>
                <form action="../Profil/profil.php" class="d-flex mt-4" id = "profilprofil" role="search">
                </form>
                <form action="../login/login.php" class="d-flex mt-3" id = "loginlogin" role="search">
                    <button class="btn btn-outline-success btnLogin" type="submit" id="btn_login">Login</button>
                </form>

            </div>
        </div>
    </div>
</nav>

</body>
</html>
