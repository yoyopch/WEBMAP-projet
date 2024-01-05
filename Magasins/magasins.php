<?php

if  (count($_POST)==0) {
    require("magasins.tpl");
}

function getMagasins() {
    require('../connectSQL.php');

    try {
        // Préparation de la requête SQL
        $query = "SELECT * FROM Magasins";
        $statement = $pdo->prepare($query);

        // Exécution de la requête
        $statement->execute();

        // Récupération des résultats
        $magasins = $statement->fetchAll(PDO::FETCH_ASSOC);

        return $magasins;
    } catch (PDOException $e) {
        // Gestion des erreurs
        echo "Erreur : " . $e->getMessage();
        die();
    }
}
function getProduits($idMagasin) {
    require('../connectSQL.php');

    try {
        // Préparation de la requête SQL avec une condition WHERE pour filtrer par magasin
        $query = "SELECT * FROM Produits WHERE id_magasin = :idMagasin";
        $statement = $pdo->prepare($query);

        // Remplacer :idMagasin par la valeur réelle du paramètre
        $statement->bindParam(':idMagasin', $idMagasin, PDO::PARAM_INT);

        // Exécution de la requête
        $statement->execute();

        // Récupération des résultats
        $produits = $statement->fetchAll(PDO::FETCH_ASSOC);

        return $produits;
    } catch (PDOException $e) {
        // Gestion des erreurs
        echo "Erreur : " . $e->getMessage();
        return null;
    }
}

if (isset($_POST['action'])){
    $action = $_POST['action'];

    switch ($action){
        case 'magasins':
            $resultat = getMagasins();
            break;
        case 'produits':
            $resultat = getProduits($_POST['id_magasin']);
            break;
        default:
            $resultat = "erreur";
    }

    echo json_encode($resultat);
}

