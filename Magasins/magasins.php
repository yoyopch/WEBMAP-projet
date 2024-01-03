<?php

function getMagasins(PDO $pdo) {
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

// Exemple d'utilisation
try {
    require('../connectSQL.php');


    // Appel de la fonction pour récupérer les magasins
    $magasins = getMagasins($pdo);

    // Affichage des résultats
    if ($magasins) {
        foreach ($magasins as $magasin) {
            echo "ID: " . $magasin['id_magasin'] . "<br>";
            echo "Nom du Magasin: " . $magasin['nom_magasin'] . "<br>";
            echo "Adresse: " . $magasin['adresse'] . "<br>";
            echo "Ville: " . $magasin['ville'] . "<br>";
            echo "<hr>";
        }
    } else {
        echo "Aucun magasin trouvé.";
    }
} catch (PDOException $e) {
    // Gestion des erreurs de connexion
    echo "Erreur de connexion : " . $e->getMessage();
    die();

}

