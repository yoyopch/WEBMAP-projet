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

            if (isset($_SESSION['profil']['isConnected']) && $_SESSION['profil']['isConnected'] === true) {

                $produitToAdd = array('Produit' => $produits, 'quantite' => 0);
                $key = array_search($produitToAdd['Produit'], array_column($_SESSION['profil']['cart'], 'Produit'));
                if ($produits[0]['stock']>0){

                    if($_SESSION['profil']['cart'][$key]['quantite'] < $produits[0]['stock']) {

                        if ($key !== false) {
                            $_SESSION['profil']['cart'][$key]['quantite'] += 1;
                            return [
                                'id' => 1,
                                'Message' => 'Le produit a été ajouté à votre panier'
                            ];
                        } else {

                            if (isset($_SESSION['profil']['cart'][0])) {
                                if ($_SESSION['profil']['cart'][0]['Produit'][0]['id_magasin'] == $magasin) {
                                    $produitToAdd['quantite'] = 1;
                                    $_SESSION['profil']['cart'][] = $produitToAdd;
                                    return [
                                        'id' => 1,
                                        'Message' => 'Le produit a été ajouté à votre panier'
                                    ];
                                } else {
                                    return [
                                        'id' => 2,
                                        'Message' => 'Vous avez déjà des produits d\'un autre magasin dans votre panier'
                                    ];
                                }
                            } else {

                                $produitToAdd['quantite'] = 1;
                                $_SESSION['profil']['cart'][] = $produitToAdd;
                                return [
                                    'id' => 1,
                                    'Message' => 'Le produit a été ajouté à votre panier'
                                ];
                            }
                        }
                    }else{
                        return [
                            'id' => 2,
                            'Message' => 'Vous avez attent le max'
                        ];
                    }

                }else{
                    return [
                        'id' => 2,
                        'Message' => 'Plus de stock!'
                    ];
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

function removeInCart($product,$magasin){
    require('../connectSQL.php');


    if (isset($_SESSION['profil']['isConnected']) && $_SESSION['profil']['isConnected'] === true) {


        foreach ($_SESSION['profil']['cart'] as $index => $item) {
            $id_produit = $item['Produit'][0]['id_produit'];
            $id_magasin = $item['Produit'][0]['id_magasin'];

            if ($id_produit == $product && $id_magasin == $magasin) {
                if ($_SESSION['profil']['cart'][$index]['quantite'] <= 1 ){
                    unset($_SESSION['profil']['cart'][$index]);
                    $_SESSION['profil']['cart'] = array_values($_SESSION['profil']['cart']);
                    return true;
                }else {
                    $_SESSION['profil']['cart'][$index]['quantite'] -= 1;
                    return [
                        'id' => 1,
                        'Message' => 'vous avez retiré un produit de votre panier'
                    ];
                }
            }
        }

    }else{
        return false;
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
                $resultat = [
                    'id' => 2,
                    'Message' => 'Vous devez vous connecter à votre compte pour y accéder'
                ];
            }
            break;
        case 'isconenctedNav':
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
        case 'removeincart':
            $resultat = removeInCart($_POST['product'],$_POST['magasin']);
            break;
        default:
            $resultat = "erreur";
    }

    echo json_encode($resultat);
}

