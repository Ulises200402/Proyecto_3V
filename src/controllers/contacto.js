const imagenes = document.querySelectorAll('.slider-imagenes img');
const botones = document.querySelectorAll('.botones-slider button');
let indice = 0;

imagenes[0].classList.add('active');

botones[0].addEventListener('click', () => {
    indice--;
    if (indice < 0) {
        indice = imagenes.length - 1;
    }
    cambiarImagen();
});

botones[1].addEventListener('click', () => {
    indice++;
    if (indice >= imagenes.length) {
        indice = 0;
    }
    cambiarImagen();
});

function cambiarImagen() {
    imagenes.forEach((imagen) => {
        imagen.classList.remove('active');
    });
    imagenes[indice].classList.add('active');
}

setInterval(() => {
    indice++;
    if setInterval(() => {
    indice++;
    if (indice >= imagenes.length) {
        indice = 0;
    }
    cambiarImagen();
}, 5000);

// Agregar mapa de Google Maps
function initMap() {
    const mapa = new google.maps.Map(document.getElementById('mapa'), {
        center: { lat: 37.7749, lng: -122.4194 },
        zoom: 13,
    });
}

// Inicializar mapa
google.maps.event.addDomListener(window, 'load', initMap);

