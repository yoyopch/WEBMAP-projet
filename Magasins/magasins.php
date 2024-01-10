<?php
session_start();




    if (count($_POST) == 0) {
        require("magasins.tpl");
    }

    if (!isset($_SESSION['profil']['cart'])) {
        $_SESSION['profil']['cart'] = array();
    }

    function getMagasins()
    {
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

    function getProduits($idMagasin)
    {
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


    function addInCart($product,$magasin){
        require('../connectSQL.php');

        try {
            // Préparation de la requête SQL avec une condition WHERE pour filtrer par magasin
            $query = "SELECT * FROM Produits WHERE id_magasin = :idMagasin and id_produit = :idproduit ";
            $statement = $pdo->prepare($query);

            $statement->bindParam(':idMagasin', $magasin, PDO::PARAM_INT);
            $statement->bindParam(':idproduit', $product, PDO::PARAM_INT);
            $statement->execute();

            $produits = $statement->fetchAll(PDO::FETCH_ASSOC);

            if ($produits[0]['stock']>0){
                if (isset($_SESSION['profil']['isConnected']) && $_SESSION['profil']['isConnected'] === true) {

                    $produitToAdd = array('Produit' => $produits, 'quantite' => 0);
                    $key = array_search($produitToAdd['Produit'], array_column($_SESSION['profil']['cart'], 'Produit'));
                    if ($key !== false) {
                        $_SESSION['profil']['cart'][$key]['quantite'] += 1;
                    } else {
                        $produitToAdd['quantite'] = 1;
                        $_SESSION['profil']['cart'][] = $produitToAdd;
                    }

                    return  true;
                }else{
                    return false;
                }
            } else {
                return false;
            }
        } catch (PDOException $e) {
            // Gestion des erreurs
            echo "Erreur : " . $e->getMessage();
            return null;
        }
    }

    if (isset($_POST['action'])) {
        $action = $_POST['action'];

        switch ($action) {
            case 'magasins':
                $resultat = getMagasins();
                break;
            case 'produits':
                $resultat = getProduits($_POST['id_magasin']);
                break;
            case 'isconencted':
                if (isset($_SESSION['profil']['isConnected']) && $_SESSION['profil']['isConnected'] === true) {

                    $resultat = $_SESSION['profil']['isConnected'];
                }else{
                    $resultat = false;
                }
                break;
            case 'addincart':
                $resultat = addInCart($_POST['product'],$_POST['magasin']);
                break;
            case 'getcart':
                $resultat = $_SESSION['profil']['cart'];
                break;
            default:
                $resultat = "erreur";
        }

        echo json_encode($resultat);
    }

