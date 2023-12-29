/* eslint-disable no-undef */
/**
 * location
 */

// config map
let config = {
    minZoom: 7,
    maxZoom: 18,
};
// magnification with which the map will start
const zoom = 18;
// co-ordinates
const lat = 52.22977;
const lng = 21.01178;

// calling map
const map = L.map("map", config).setView([lat, lng], zoom);

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
    // if location found show marker
    .on("locationfound", (e) => {
        console.log(e);
        // marker
        const marker = L.marker([e.latitude, e.longitude], { icon: p_icon });
        // add marker
        map.addLayer(marker);
    })
    // if error show alert
    .on("locationerror", (e) => {
        console.log(e);
        alert("Location access denied.");
    });

// ------------------------------------------------

// template svg icon
const s_icon = L.icon({
    iconUrl: '../IMG/IMG_magasins/shop.png',
    className: "marker",
    iconSize: [32, 32], // Ajustez la taille de l'icône selon vos besoins
    iconAnchor: [16, 32], // Ajustez l'ancre de l'icône si nécessaire
    popupAnchor: [0, -32], // Ajustez la position de la fenêtre contextuelle si nécessaire
});

const points = [
    {
        lat: 48.8737952,
        lng: 2.2924526,
        text: "<h3>First popup 😀</h3><br>Grab the lower right corner and reduce the width of the map.",
    },
    {
        lat: 48.8583735,
        lng: 2.2896104,
        text: "<h3>Second popup 😀</h3><br>Grab the lower right corner and reduce the width of the map.",
    },
];

points.map(({ lat, lng, text }) => {
    // create marker and add to map
    const marker = L.marker([lat, lng], {
        icon: s_icon,
    }).addTo(map);

    // crewate popup, set contnet
    const popup = L.popup({
        pane: "fixed",
        className: "popup-fixed test",
        autoPan: false,
    }).setContent(text);

    marker.bindPopup(popup).on("click", fitBoundsPadding);
});

// remove all animation class when popupclose
map.on("popupclose", function (e) {
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
    map.setView([e.latitude, e.longitude], zoom);
}