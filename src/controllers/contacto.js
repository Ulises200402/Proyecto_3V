// Agregar mapa de Google Maps
function initMap() {
    const mapa = new google.maps.Map(document.getElementById('mapa'), {
        center: { lat: 37.7749, lng: -122.4194 },
        zoom: 13,
    });
}

// Inicializar mapa
google.maps.event.addDomListener(window, 'load', initMap);

