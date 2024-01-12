
/* eslint-disable no-undef */
/**
 * popup in a fixed position
 */

// config map
let config = {
    minZoom: 7,
    maxZoom: 18,
};
// magnification with which the map will start
const zoom = 13;

let allmagasins
let cart

// co-ordinates
const lat = 48.8619029057891;
const lng = 2.3469980436428877;
// calling map
const map = L.map("map", config).setView([lat, lng], zoom);


// Location

// Used to load and display tile layers on the map
// Most tile servers require attribution, which you can set under `Layer`
L.tileLayer("https://tile.openstreetmap.org/{z}/{x}/{y}.png", {
    attribution:
        '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
}).addTo(map);

const p_icon = L.icon({
    iconUrl: '../IMG/IMG_magasins/position.png',
    iconSize: [32, 32], // Ajustez la taille de l'icône selon vos besoins
    iconAnchor: [16, 32], // Ajustez l'ancre de l'icône si nécessaire
    popupAnchor: [0, -32], // Ajustez la position de la fenêtre contextuelle si nécessaire
});

map
    .locate({
        // https://leafletjs.com/reference-1.7.1.html#locate-options-option
        setView: true,
        enableHighAccuracy: true,
    })
    // if location found show marker and circle
    .on("locationfound", (e) => {
        //console.log(e);
        // marker
        const marker = L.marker([e.latitude, e.longitude], {icon: p_icon});
        // add marker
        map.addLayer(marker);
    })
    // if error show alert
    .on("locationerror", (e) => {
        //console.log(e);
        alert("Location access denied.");
    });

var pane = map.createPane("fixed", document.getElementById("map"));


var customIcon = L.icon({
    iconUrl: "../IMG/iconMonuments.png",
    iconSize: [32, 32],
    iconAnchor: [16, 32],
    popupAnchor: [0, -32]
});

var AffichageGare=false
var markersGare=null
var gares = document.querySelector("#btnGares")
gares.addEventListener("click", function () {
    if (!AffichageGare) {
        // Supprimer les anciens marqueurs de gare
        if (markersGare) {
            map.removeLayer(markersGare);
        }
        addpoint();

        fetch("liste-des-gares.json")
            .then(response => response.json())
            .then(data => {
                // Utiliser un ensemble pour stocker les noms uniques des gares
                var uniqueNames = new Set();

                // Créer un groupe de clusters de marqueurs
                markersGare = L.markerClusterGroup();

                // Ajouter les marqueurs avec des icônes personnalisées pour chaque gare TGV en Île-de-France
                data.forEach(gare => {
                    const departementsIDF = ["PARIS", "SEINE-ET-MARNE", "YVELINES", "ESSONNE", "HAUTS-DE-SEINE", "SEINE-SAINT-DENIS", "VAL-DE-MARNE", "VAL-D'OISE"];
                    const isIDF = departementsIDF.includes(gare.fields.departemen);
                    const name = gare.fields.libelle;

                    if (isIDF && !uniqueNames.has(name)) {
                        // Ajouter le nom au set pour éviter les doublons
                        uniqueNames.add(name);

                        // Ajouter le marqueur au groupe de clusters
                        let marker = L.marker([gare.fields.geo_shape.coordinates[1], gare.fields.geo_shape.coordinates[0]], {icon: customIcon})
                            .bindPopup("<b>" + gare.fields.libelle + "</b><br>Commune: " + gare.fields.commune);
                        map.addLayer(markersGare);
                        markersGare.addLayer(marker);
                    }
                });

                // Ajouter le groupe de clusters à la carte
                map.addLayer(markersGare);
            })
            .catch(error => {
                console.log("Erreur lors du chargement des données : ", error);
            });
        AffichageGare=true
        gares.style.backgroundColor="#00c88f";


    } else{
        if (markersGare) {
            markersGare.clearLayers();
            map.removeLayer(markersGare);
        }
        AffichageGare = false;
        gares.style.backgroundColor="white";
    }
})
//Fin geo loc






window.addEventListener("load", init);





function init(){
    getmagasins()
}






// Used to load and display tile layers on the map
// ------------------------------------------------

var popup = document.getElementById("popup")
function hidePopupClass(){
    popup.className = "show"
    popup.style.display = "flex"
    popup.style.flexDirection = "column"
    popup.style.alignItems=" center";
    popup.style.boxShadow="0px 0px 40px 9px #000000";
}
function showPopupClass(){
    popup.className = "hide"
    popup.style.display = "none"
}
btn_panier.addEventListener("click" , function(){
    switch(popup.className){
        case "hide":
            isConnected(function(reponse){
                if (reponse) {
                    getCart()
                    hidePopupClass()
                }
            })
            break
        case "show":
            showPopupClass()
            break
        default:
            alert("Ne modifier pas le code svp")
    }
})


// ------------------------------------------------


const s_icon = L.icon({
    iconUrl: '../IMG/IMG_magasins/shop.png',
    className: "marker",
    iconSize: [32, 32], // Ajustez la taille de l'icône selon vos besoins
    iconAnchor: [16, 32], // Ajustez l'ancre de l'icône si nécessaire
    popupAnchor: [0, -32], // Ajustez la position de la fenêtre contextuelle si nécessaire
});



function ajouterFruit(id_magasin, callback) {
    let html = '';
    let color = 'green';
    getproduits(id_magasin, function(response) {
        for (const element of response) {
            if ( element.stock > 0 ){
                color = 'green';
            }else
            {
                color = 'red';
            }
            html += `
            <button class="custom-btn" onclick='addInCart(${element.id_produit},${element.id_magasin})'>
                <div class="fruit-item">
                    <img src=${element.chemin_image} alt="test" class="fruit-img" />
                    <div class="fruit-details">
                        <div class = "fruit-name-stock">
                        <h5 class="fruit-name">${element.nom_produit} | ${element.description_produit}</h5>
                        <h5 class="fruit-stock">Stock ${element.stock}</h5>
                        </div>
                        <p class="fruit-price">${element.prix}€</p>
                    </div>
                    <div class="bulle-etats" style="background-color: ${color};"></div>
                </div>
            </button>
            `;
        }
        callback(html);
    });
}


function addpoint (){
    for (const element of allmagasins) {
        const marker = L.marker([element["latitude"], element["longitude"]], {
            icon: s_icon,
            idmagsin: element["id_magasin"]
        }).addTo(map);

        const id_magasin = marker["options"]["idmagsin"].toString()
        // crewate popup, set contnet

        const popup = L.popup({
            pane: "fixed",
            className: "popup-fixed",
            autoPan: false,
        })
        ajouterFruit(id_magasin, function (generatedHTML) {
            popup.setContent(generatedHTML);
        });

        marker.bindPopup(popup).on("click",fitBoundsPadding);

    }
}

// remove all animation class when popupclose
map.on("popupopen", function (e) {
    removeAllAnimationClassFromMap();
});

// ------------------------------------------------

const mediaQueryList = window.matchMedia("(min-width: 700px)");

mediaQueryList.addEventListener("change", (event) => onMediaQueryChange(event));

onMediaQueryChange(mediaQueryList);

function onMediaQueryChange(event) {
    if (event.matches) {
        document.documentElement.style.setProperty("--min-width", "true");
    } else {
        document.documentElement.style.removeProperty("--min-width");
    }
}

function fitBoundsPadding(e) {
    removeAllAnimationClassFromMap();
    // get with info div
    const boxInfoWith = document.querySelector(
        ".leaflet-popup-content-wrapper"
    ).offsetWidth;

    // add class to marker
    e.target._icon.classList.add("animation");

    // create a feature group, optionally given an initial set of layers
    const featureGroup = L.featureGroup([e.target]).addTo(map);

    // check if attribute exist
    const getPropertyWidth =
        document.documentElement.style.getPropertyValue("--min-width");

    // sets a map view that contains the given geographical bounds
    // with the maximum zoom level possible
    map.fitBounds(featureGroup.getBounds(), {
        paddingTopLeft: [getPropertyWidth ? -boxInfoWith : 0, 10],
    });
}

function removeAllAnimationClassFromMap() {
    // get all animation class on map
    const animations = document.querySelectorAll(".animation");
    animations.forEach((animation) => {
        animation.classList.remove("animation");
    });

    // back to default position
    map.setView([lat, lng], zoom);
}


function getmagasins(){
    $.ajax({
        type: "POST",
        url: "../Magasins/magasins.php",
        data: {
            action: 'magasins'
        },
        dataType: "json",

        success: function(response){
            allmagasins  = response
            addpoint()

        }
    });
}

function getproduits(id_magasin, callback) {
    $.ajax({
        type: "POST",
        url: "../Magasins/magasins.php",
        data: {
            action: 'produits',
            id_magasin: parseInt(id_magasin)
        },
        dataType: "json",

        success: function(response) {
            callback(response,id_magasin);
        }
    });
}


function addInCart(Product,Id_magasin){
    isConnected(function (reponse){

        if (reponse) {

            $.ajax({
                type: "POST",
                url: "../Magasins/magasins.php",
                data: {
                    action: 'addincart',
                    product: parseInt(Product),
                    magasin: parseInt(Id_magasin)
                },
                dataType: "json",

                success: function (response) {
                    showNotification(response['id'], response['Message'])
                    getCart()
                }
            });
        }
    })
}

function getCart(){
    $.ajax({
        type: "POST",
        url: "../Magasins/magasins.php",
        data: {
            action: 'getcart',
        },
        dataType: "json",

        success: function(response){
            cart = response;
            if (cart != null){
                let html = '';
                let html2 = '';
                let idmagsin = 0;
                for (const element of cart) {
                    const produits = element.Produit;
                    const quantite = element.quantite;


                    for (const produit of produits) {
                        idmagsin = produit.id_magasin;
                        html2 += `
                            <div class="info_panier">
                                <img src=${produit.chemin_image}>
                                <p>${produit.nom_produit}</p>
                                <p>${produit.prix}</p>
                                <p>${quantite}</p>
                                <button type="button" onclick="deleteProductInCart(${produit.id_produit},${produit.id_magasin})" class="btn_poubelle" >  <img src="../IMG/IMG_magasins/poubelle.png" alt="poubelle" width= 25px height = 25px></button>
                            </div>
                        `
                    }
                }


                for (const mag of allmagasins) {

                    if (mag.id_magasin == idmagsin){
                        html = `<h2>Votre panier <br> ${mag.nom_magasin}</h2>`
                    }else{
                        html = `<h2>Votre panier</h2>`
                    }
                }

                document.querySelector('.put-product-here').innerHTML = html + html2
            }
        }
    });
}

function deleteProductInCart(Product,Id_magasin){
    $.ajax({
        type: "POST",
        url: "../Magasins/magasins.php",
        data: {
            action: 'removeincart',
            product: parseInt(Product),
            magasin: parseInt(Id_magasin)
        },
        dataType: "json",

        success: function(response){
            showNotification(response['id'],response['Message'])
            getCart()

        }
    });
}

function validCart(){
    if (cart.length !== 0){
        $.ajax({
            type: "POST",
            url: "../Magasins/magasins.php",
            data: {
                action: 'validcommand',
                product: cart,

            },
            dataType: "json",

            success: function(response){
                showNotification(response['id'],response['Message'])
                getCart()
                getmagasins()

            }
        });
    }
}


function isConnected(callback){
    $.ajax({
        type: "POST",
        url: "../Magasins/magasins.php",
        data: {
            action: 'isconencted',
        },
        dataType: "json",

        success: function(response) {
            if (typeof response === 'object' && response !== null) {
                showNotification(response['id'], response['Message'])
            }else {
                callback(response);
            }
        }
    });
}


function showNotification(what,text){

    switch (what) {
        case 1:
            iziToast.success({
                title: 'Succès',
                message: text,
                timeout: 3000
            });
            break;
        case 2:
            iziToast.error({
                title: 'Erreur',
                message: text,
                timeout: 3000
            });
            break;

    }

}