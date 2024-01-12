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

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/izitoast@1.4.0/dist/css/iziToast.min.css">
    <script src="https://cdn.jsdelivr.net/npm/izitoast@1.4.0/dist/js/iziToast.min.js"></script>


</head>
<?php include('../Navbar/navbar.php'); ?>
<body>
<button class="btn_panier" id="btn_panier">
    <img src="../IMG/iconPanier.svg"/>
</button>
<div id="popup" class="hide">
    <div class="put-product-here">

    </div>
    <button class="btn_valider" id="btn_valider" onclick="validCart()">Valider le panier </button>
</div>

<div id="map"></div>
<span id="btnGares">Gares</span>
<script src="magasins.js"></script>
</body>
</html>