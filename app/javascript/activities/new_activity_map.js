var map = null;
var mapjsReady = false;
window.mapjsReady = mapjsReady;

$(document).ready(function () {
  console.log('OIOIOI');
  mapboxgl.accessToken =
    'pk.eyJ1IjoiZmFsZWlyb2p1bmUiLCJhIjoiY2s3NjhyYTVvMDltNDNkcm9tenVoMXBhdiJ9.EbyPWeEk-RfFdK1URdMPuA';
  map = new mapboxgl.Map({
    container: 'map',
    center: [47.539909, 9.862701],
    zoom: 2,
    style: 'mapbox://styles/faleirojune/ck80mrytn3aqr1intudwvjiig',
  });
  window.mapjsReady = true;
  createMap(map);
  activities = gon.activities;
});

function createMap(map) {
  //Map geolocation setup
  const geolocate = new mapboxgl.GeolocateControl({
    positionOptions: {
      enableHighAccuracy: true,
    },
    trackUserLocation: true,
  });
  map.addControl(geolocate);

  onMapLoadEvents(map, geolocate);
}

function onMapLoadEvents(map, geolocate) {
  map.on('load', function () {
    //Triggers geolocation to set map coords to user coords

    geolocate.trigger();

    //Creates very slight 3D effect
    map.setPitch(5);

    //Populate map with markers

    // add markers to map
    // geojson.features.forEach(function (marker) {
    //   // create a HTML element for each feature
    //   var el = document.createElement('div');
    //   el.innerHTML = '<span class="icon is-large"><i class="fab fa-angellist fa-3x"></i></span>';
    //   el.className = 'marker';

    //   // make a marker for each feature and add to the map
    //   new mapboxgl.Marker(el)
    //     .setLngLat(marker.geometry.coordinates)
    //     .setPopup(
    //       new mapboxgl.Popup({ offset: 25 }) // add popups
    //         .setHTML('<h3>' + marker.properties.title + '</h3><p>' + marker.properties.description + '</p>')
    //     )
    //     .addTo(map);
    // });
  });
}
