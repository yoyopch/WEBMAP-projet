<!doctype html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <title>Magasins</title>
    <link
            rel="stylesheet"
            href="https://unpkg.com/leaflet@1.9.2/dist/leaflet.css"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://unpkg.com/leaflet@1.9.2/dist/leaflet.js"></script>
    <!-- Inclure Leaflet.markercluster -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet.markercluster/dist/MarkerCluster.css" />
    <link rel="stylesheet" href="https://unpkg.com/leaflet.markercluster/dist/MarkerCluster.Default.css" />
    <script src="https://unpkg.com/leaflet.markercluster/dist/leaflet.markercluster.js"></script>


    <link rel="stylesheet" href="magasins.css"/>
    <link rel="stylesheet" href="../Navbar/navbar.css">

</head>
<?php include('../Navbar/navbar.php'); ?>
<body>
<button class="btn_panier" id="btn_panier">
    <img src="../IMG/IMG_magasins/shop.png"/>
</button>
<div id="popup" class="hide">
    <form method="POST">
        <h2>Votre panier</h2>
        <div class="info_panier">
            <img src="../IMG/IMG_magasins/Pear.svg"/>
            <p>Poire BIO</p>
            <p>1,99 €</p>
            <p>1</p>
            <img src="../IMG/IMG_magasins/Pear.svg"/>
        </div>
        <div class="info_panier">
            <img src="../IMG/IMG_magasins/Pear.svg"/>
            <p>Poire BIO</p>
            <p>1,99 €</p>
            <p>1</p>
            <img src="../IMG/IMG_magasins/Pear.svg"/>
        </div>
    </form>

    <button class="btn_valider" id="btn_valider">Valider le panier</button>
</div>

<div id="map"></div>

<script src="magasins.js">

</script>
</body>
</html>