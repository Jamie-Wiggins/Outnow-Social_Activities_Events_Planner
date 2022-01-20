$(document).on('turbolinks:load', function () {
  window.map = null;
  window.geocoder = null;
  window.geojson = null;
  window.activities = null;
  window.geolocate = null;
  window.usercoords = [];
  window.allMarkers = [];

  window.users = null;
  window.activities = gon.activities;
  var geotriggered = false;
  window.geotriggered = geotriggered;
  var mouseLat = 0;
  window.mouseLat = mouseLat;
  var mouseLong = 0;
  window.mouseLong = mouseLong;
  window.filtering_distance = false;

  // jamie payment test

  const public_key = document.querySelector("meta[name='stripe-public-key']").content;
  const stripe = Stripe(public_key);
  // console.log("jamie");
  const elements = stripe.elements();
  const style = {
    base: {
      color: '#32325d',
      lineHeight: '26px',
      fontFamily: '"Helvetica Neue", Helvetica, sans-serif',
      fontSmoothing: 'antialiased',
      fontSize: '16px',
      '::placeholder': {
        color: '#aab7c4'
      }
    },
    invalid: {
      color: '#fa755a',
      iconColor: '#fa755a'
    }
  };


  //This variable lets map.js load before main.js sets styles to avoid null exceptions
  var mapjsReady = false;
  window.mapjsReady = mapjsReady;
  // END VARIABLES
  if (location.pathname == '/') {
    mapboxgl.accessToken =
      'pk.eyJ1IjoiZmFsZWlyb2p1bmUiLCJhIjoiY2s3NjhyYTVvMDltNDNkcm9tenVoMXBhdiJ9.EbyPWeEk-RfFdK1URdMPuA';
    map = new mapboxgl.Map({
      container: 'map',
      center: [47.539909, 9.862701],
      zoom: 2,
      style: 'mapbox://styles/faleirojune/ck80mrytn3aqr1intudwvjiig',
    });

    window.mapjsReady = true;
    $("#distance-checkbox").change(function () {
      if (this.checked) {
        window.filtering_distance = true;
        var newFeature = null;

        geojson = {
          type: 'FeatureCollection',
          features: [],
        };
        activities.forEach((element) => {

          if (element.status == 1) {

            if (element.latitude && element.longitude) {
              element.distance = calculateDistance(element.latitude, element.longitude);
            }
            newFeature = {
              type: 'Feature',
              geometry: {
                type: 'Point',
                coordinates: [0, 0],
              },
              properties: {
                title: 'Default Title',
                description: 'Default Description',
              },
            };
            newFeature.type = 'Feature';
            newFeature.geometry.type = 'Point';
            newFeature.geometry.truecoordinates = [element.longitude, element.latitude];
            var shuff_lat = getRandomInRange(+element.latitude - 0.005, +element.latitude + 0.005, 3);
            var shuff_long = getRandomInRange(+element.longitude - 0.005, +element.longitude + 0.005, 3);
            newFeature.geometry.coordinates = [shuff_long, shuff_lat];
            newFeature.properties.id = element.id;
            newFeature.properties.distance = element.distance;
            newFeature.properties.host = element.host;
            newFeature.properties.title = element.title;
            newFeature.properties.description = element.description;
            newFeature.properties.image = element.image;
            newFeature.properties.icon = element.icon;
            newFeature.properties.colour = element.color;
            //this code makes the date and time readable for the map
            var current_start_datetime = element.start_time;
            newFeature.properties.start_date = current_start_datetime.slice(0, 10);
            newFeature.properties.start_time = current_start_datetime.slice(11, 16);
            //newFeature.properties.image = element.image;
            geojson.features[newFeature.properties.id] = newFeature;
          }
        });
      } else {
        window.filtering_distance = false;
      }
    });
    createMap(map);
    // $('.map_activity').click(function () {
    //var e = $(this).attr('id');
    // console.log(e)
    // $('div.card-content > div.media > div.media-content > p.title.is-5').html(geojson.features[e].properties.title);
    // $('div.card-content > div.media > div.media-content > p.subtitle.is-6').html(geojson.features[e].properties.host);
    // $('div.card-content > div.content > p.description').html(geojson.features[e].properties.description);
    // });
    // do something here
    $('.mapboxgl-canvas-container').on('click', '.map_activity', function (event) {
      window.makeCardSmall();
      $('.event-card').css('opacity', '1');
      $('.event-card').css('visibility', 'visible');

      var e = $(this).attr('id');
      $(document).ajaxComplete(function () {
        $('.card-tags .tag').css("background-color", geojson.features[e].properties.colour);
      });

      $.ajax({
        url: '/activities/' + e,
        type: 'GET',
        data: {},
        success: function (data) {
          const cardElement = document.getElementById('card-element');

          if (cardElement != null) {
            const card = elements.create('card', { style: style });
            card.mount(cardElement);
            card.addEventListener('change', ({ error }) => {
              const displayError = document.getElementById('card-errors');
              if (error) {
                displayError.textContent = error.message;
              } else {
                displayError.textContent = '';
              }
            });
            const form = document.getElementById('new_chatroom_user');
            form.addEventListener('submit', async (event) => {
              event.preventDefault();
              const { token, error } = await stripe.createToken(card);

              if (error) {
                // Inform the customer that there was an error.
                const errorElement = document.getElementById('card-errors');
                errorElement.textContent = error.message;
              } else {
                // Send the token to your server.
                stripeTokenHandler(token);
              }
            });

            const stripeTokenHandler = (token) => {
              // Insert the token ID into the form so it gets submitted to the server
              const form = document.getElementById('new_chatroom_user');
              const hiddenInput = document.createElement('input');
              hiddenInput.setAttribute('type', 'hidden');
              hiddenInput.setAttribute('name', 'stripeToken');
              hiddenInput.setAttribute('value', token.id);
              form.appendChild(hiddenInput);

              ["brand", "exp_month", "exp_year", "last4"].forEach(function (field) {
                addFieldToForm(form, token, field);
              });

              // Submit the form
              form.submit();
            }

            function addFieldToForm(form, token, field) {
              var hiddenInput = document.createElement('input');
              hiddenInput.setAttribute('type', 'hidden');
              hiddenInput.setAttribute('name', "user[card_" + field + "]");
              hiddenInput.setAttribute('value', token.card[field]);
              form.appendChild(hiddenInput);
            }
          }
        },
      });

    });
  }
});
function get_mouse_coords(e) {
  // e.lngLat is the longitude, latitude geographical position of the event
  window.mouseLat = e.lngLat.lat;
  window.mouseLong = e.lngLat.lng;
}

window.pickerClicked = function pickerClicked() {
  $('.sidebar-right').css('visibility', "hidden");
  $('.event-card').css('visibility', "hidden");
  $('.right-sidebar').css("visibility","hidden");
  $('.picking-flavourtext').css('visibility',"visible");
  $('.hero-body').css("visibility","hidden");
  $('.mapboxgl-canvas').addClass("pointerly");

  if (sidebar_open) {
    sidebar_open = false;
    $('.chat-wrapper').removeClass('is-active');
    $('.sidebar-left').removeClass('expanded');
  }
  map.on('mousemove', get_mouse_coords);
  $('.mapboxgl-canvas').click(function () {
    $('.create-activity-modal').addClass('is-active');
    $('.create-activity-modal.modal').addClass('is-active');
    $('.sidebar-right').css('visibility', "visible");
    $('.event-card').css('visibility', "visible");
    $('.right-sidebar').css("visibility","visible");
    $('.picking-flavourtext').css('visibility',"hidden");
    $('.hero-body').css("visibility","visible");
    $('.mapboxgl-canvas').removeClass("pointerly");


    if (!sidebar_open) {
      {
        sidebar_open = true;
        window.storeData('sidebar_open', 'true');
        $('.chat-wrapper').addClass('is-active');
        $('.sidebar-left').addClass('expanded');
      }
      //Applying long lat values

      document.getElementById('activity_longitude').value = window.mouseLong;
      document.getElementById('activity_latitude').value = window.mouseLat;
      map.off('mousemove', get_mouse_coords);
    }
  });
};
function createMap(map) {
  //Map geolocation setup
  geolocate = new mapboxgl.GeolocateControl({
    positionOptions: {
      enableHighAccuracy: true,
    },
    trackUserLocation: true,
  });
  map.addControl(geolocate);
  //Passing coords of user to var
  geolocate.on('geolocate', function (e) {
    var lon = e.coords.longitude;
    var lat = e.coords.latitude
    window.usercoords = [lat, lon];
    console.log("User Position: " + usercoords);
  });
  onMapLoadEvents(map, geolocate);
  loadMarkers();
}
function onMapLoadEvents(map, geolocate) {
  map.on('load', function () {
    //Triggers geolocation to set map coords to user coords
    geolocate.trigger();
    window.geotriggered = true;
    //Creates very slight 3D effect
    map.setPitch(5);
    //Populate map with markers
    // add markers to map
  });
}
function getRandomInRange(from, to, fixed) {
  return (Math.random() * (to - from) + from).toFixed(fixed) * 1;
}

function loadMarkers() {
  var filteredActivities = null;
  //A "feature" refers to a point on the map that holds values, a JSON object
  filteredActivities = activities;
  // FILTERS HANDLING ///////////////////////////////////////////////////////
  $(".apply-filter-btn").click(function () {
    window.ApplyFilters(activities);
  });

  populateMap(filteredActivities);



};

window.calculateDistance = function calculateDistance(dest_lat, dest_long) {
  var from = turf.point([window.usercoords[1], window.usercoords[0]]);
  var to = turf.point([dest_long, dest_lat]);

  // var from = turf.point([-75.343, 39.984]);
  // var to = turf.point([-75.534, 39.123]);
  var options = { units: 'kilometers' };

  var distance = turf.distance(from, to, options);
  return distance;
}

function populateMap(filteredActivities) {

  var newFeature = null;
  if (window.allMarkers !== null) {
    for (var i = window.allMarkers.length - 1; i >= 0; i--) {
      window.allMarkers[i].remove();
    }
  }
  geojson = {
    type: 'FeatureCollection',
    features: [],
  };
  var x = 0;
  //populating map's geojson with all activities
  if (filtering_distance) {
    filteredActivities.forEach((element) => {
      if (element.status == 1) {
        x += 1;
        newFeature = {
          type: 'Feature',
          geometry: {
            type: 'Point',
            coordinates: [0, 0],
          },
          properties: {
            title: 'Default Title',
            description: 'Default Description',
          },
        };
        newFeature.type = 'Feature';
        newFeature.geometry.type = 'Point';
        newFeature.geometry.truecoordinates = [element.longitude, element.latitude];
        var shuff_lat = getRandomInRange(+element.latitude - 0.005, +element.latitude + 0.005, 3);
        var shuff_long = getRandomInRange(+element.longitude - 0.005, +element.longitude + 0.005, 3);
        newFeature.geometry.coordinates = [shuff_long, shuff_lat];
        newFeature.properties.id = element.id;
        newFeature.properties.distance = element.distance;
        newFeature.properties.host = element.host;
        newFeature.properties.title = element.title;
        newFeature.properties.description = element.description;
        newFeature.properties.image = element.image;
        newFeature.properties.icon = element.icon;
        newFeature.properties.colour = element.color;
        //this code makes the date and time readable for the map
        var current_start_datetime = element.start_time;
        newFeature.properties.start_date = current_start_datetime.slice(0, 10);
        newFeature.properties.start_time = current_start_datetime.slice(11, 16);
        //newFeature.properties.image = element.image;
        geojson.features[newFeature.properties.id] = newFeature;
      }
    });
  } else {
    filteredActivities.forEach((element) => {
      if (element.status == 1) {
        x += 1;
        newFeature = {
          type: 'Feature',
          geometry: {
            type: 'Point',
            coordinates: [0, 0],
          },
          properties: {
            title: 'Default Title',
            description: 'Default Description',
          },
        };
        newFeature.type = 'Feature';
        newFeature.geometry.type = 'Point';
        newFeature.geometry.truecoordinates = [element.longitude, element.latitude];
        var shuff_lat = getRandomInRange(+element.latitude - 0.005, +element.latitude + 0.005, 3);
        var shuff_long = getRandomInRange(+element.longitude - 0.005, +element.longitude + 0.005, 3);
        newFeature.geometry.coordinates = [shuff_long, shuff_lat];
        newFeature.properties.id = element.id;
        newFeature.properties.host = element.host;
        newFeature.properties.title = element.title;
        newFeature.properties.description = element.description;
        newFeature.properties.image = element.image;
        newFeature.properties.icon = element.icon;
        newFeature.properties.colour = element.color;
        //this code makes the date and time readable for the map
        var current_start_datetime = element.start_time;
        newFeature.properties.start_date = current_start_datetime.slice(0, 10);
        newFeature.properties.start_time = current_start_datetime.slice(11, 16);
        //newFeature.properties.image = element.image;
        geojson.features[newFeature.properties.id] = newFeature;
      }
    });
  }

  function forwardGeocoder(query) {
    var matchingFeatures = [];
    // for (var i = 0; i < geojson.features.length; i++) {
    //   var feature = geojson.features[i];
    // handle queries with different capitalization than the source data by calling toLowerCase()
    geojson.features.forEach(function (feature) {
      if (feature.properties.title.toLowerCase().search(query.toLowerCase()) !== -1) {
        // add a tree emoji as a prefix for custom data results
        // using carmen geojson format: https://github.com/mapbox/carmen/blob/master/carmen-geojson.md
        feature['text'] =
          '<i style="color: ' + feature.properties.colour + '; " class ="' + feature.properties.icon + '"></i> ' ||
          '💠 ';
        feature['place_name'] = feature.properties.title;
        feature['center'] = feature.geometry.coordinates;
        feature['place_type'] = ['activity'];
        matchingFeatures.push(feature);
      }
    });
    return matchingFeatures;
  }
  if (window.geocoder == null) {
    geocoder = new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      localGeocoder: forwardGeocoder,
      placeholder: 'Search for an activity',
      render: function (item) {
        // extract the item's maki icon or use a default
        return (
          "<div class='geocoder-dropdown-item'><div class='geocoder-dropdown-icon'>" +
          item.text +
          "<span class='geocoder-dropdown-text'>" +
          item.place_name +
          '</span></div>'
        );
      },
      marker: false,
      mapboxgl: mapboxgl,
    });
    document.getElementById('geocoder').appendChild(geocoder.onAdd(map));
  }


  geojson.features.forEach(function (marker) {
    // create a HTML element for each feature
    var el = document.createElement('div');
    el.setAttribute('id', marker.properties.id);
    el.setAttribute('class', 'marker map_activity');
    el.innerHTML =
      '<span class="fa-stack fa-2x" style="vertical-align: top;"><i style="color:' +
      marker.properties.colour +
      '"; class="fas fa-map-marker fa-stack-2x"></i>' +
      '<i class="' +
      marker.properties.icon +
      ' fa-stack-1x fa-inverse activity-icon"></span>';
    // make a marker for each feature and add to the map

    var tempMarker = new mapboxgl.Marker(el)
      .setLngLat(marker.geometry.coordinates)
      .setPopup(
        new mapboxgl.Popup({ offset: 25 }) // add popups
          .setHTML(
            '<div class="id" id=' +
            marker.properties.id +
            '"></div><h3 class="popup-title">' +
            marker.properties.title +
            '</h3><h3 class="popup-by"><h3 class="popup-start_date">' +
            marker.properties.start_date +
            '</h3><h4>'
          )
      )
      .addTo(map);
    window.allMarkers.push(tempMarker);
  });
};
window.ApplyFilters = function ApplyFilters(all_activities) {
  console.log("Applying Filters...")
  var filtering_price = false;
  var filtering_capacity = false;
  window.filtering_distance = false;
  var filtering_recommendation = false;

  var filter_price_val = window.f_priceVal;
  var filter_capacity_val = window.f_capacityVal;
  var filter_distance_val = window.f_distanceVal;

  var filters = {}
  var filteredActivityArray = [];
  if ($('#price-checkbox').is(":checked")) {
    filtering_price = true;
    $.extend(filters, { cost: (cost) => cost <= window.f_priceVal });
  }
  if ($('#capacity-checkbox').is(":checked")) {
    filtering_capacity = true;
    $.extend(filters, { attendee_max: (attendee_max) => attendee_max <= window.f_capacityVal })

  }
  if ($('#distance-checkbox').is(":checked")) {
    filtering_distance = true;
    $.extend(filters, { distance: (distance) => distance <= window.f_distanceVal });
    //Change to filtered activity array

  }
  if ($('#recommendation-checkbox').is(":checked")) {
    filtering_recommendation = true;
  }
  ///////////////// FILTER CALLBACK FUNCTION DECLARATIONS ///////
  function isPriceMet(element) {
    return element.cost <= window.f_priceVal;
  }
  function isDistanceMet(element) {
    console.log(calculateDistance);
    //SPECIAL LOGIC NEEDED
    // return element.cost <= f_priceVal;

  }
  function isCapacityMet(element) {
    return element.attendee_max <= window.f_capacityVal;
  }
  function filterArray(array, filters) {
    const filterKeys = Object.keys(filters);
    return array.filter(item => {
      // validates all filter criteria
      return filterKeys.every(key => {
        // ignores non-function predicates
        if (typeof filters[key] !== 'function') return true;
        return filters[key](item[key]);
      });
    });
  }
  //Filtering by recommended activities//
  var top10Keys = [];
  for (var i = 0; i < window.top10.length; i++) {
    top10Keys.push(window.top10[i][0]);
  }
  console.log("Top 10 KEYS: ");
  console.log(top10Keys);
  var recommended_activities = [];

  all_activities.forEach(function (a) {
    //If a recommended tag is present in an activity's tags, add that activity to the list of displayed
    if (top10Keys.some(el => a.tags.includes(el))) {
      recommended_activities.push(a);
    };
  });

  if (filtering_recommendation) {
    if (recommended_activities == null) {
      console.log("User has no recommendations!");
      var BfilteredArray = filterArray(all_activities, filters);
    } else {
      //Apply filtering to recommendation filtered results
      var BfilteredArray = filterArray(recommended_activities, filters);
    }
  } else {
    var BfilteredArray = filterArray(all_activities, filters);
  }

  console.log("Results from filtering: ");
  console.log(BfilteredArray);
  populateMap(BfilteredArray);
  ///////////////// FILTERING TIME /////////////////////
  all_activities.forEach(function (a) {
    if (filtering_price) {
      if (a.cost <= filter_price_val) {

      }
    }
  });
  /////////////////////////////////////////////////////


}
window.mapDark = function mapDark() {
  map.setStyle('mapbox://styles/faleirojune/ck80vht6s08sm1is9ucuiyp5v');
};
window.mapLight = function mapLight() {
  map.setStyle('mapbox://styles/faleirojune/ck80mrytn3aqr1intudwvjiig');
};
