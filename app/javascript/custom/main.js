// import { storeData, readData } from 'webstorage';
window.sidebar_open = false;
var dark = false;
var root = document.documentElement;


$(document).on('turbolinks:load', function () {
  if (window.readData('theme') == 'dark') {
    dark = true;
    setDark();
  }
  if (window.readData('sidebar_open') == 'true') {
    sidebar_open = true;
    $('.sidebar-left').addClass('expanded');
    $('.chat-wrapper').addClass('is-active');
  }
  //Animation fixes by adding classes after DOM loads stylesheets

  $('.sidebar-toggle').click(function () {
    if (sidebar_open) {
      sidebar_open = false;
      window.storeData('sidebar_open', 'false');
      $('.chat-wrapper').removeClass('is-active');
      $('.sidebar-left').removeClass('expanded');
    } else {
      sidebar_open = true;
      window.storeData('sidebar_open', 'true');
      $('.chat-wrapper').addClass('is-active');
      $('.sidebar-left').addClass('expanded');
    }
  });

  $('.theme-button').click(function () {
    if (dark) {
      //Set theme to LIGHT
      dark = false;
      window.storeData('theme', 'light');
      setLight();
    } else {
      //Set theme to DARK
      dark = true;
      window.storeData('theme', 'dark');
      setDark();
    }
  });
  $('.expand-btn').click(function () {
    alert("dong");
  });

  $('.sidebar-right').on('mouseenter', '.expand-btn', function () {
    $('.tagline').addClass("expanded");
    $('.expand-btn').addClass("squared");
  });
  $('.sidebar-right').on('mouseleave', '.expand-btn', function () {
    $('.tagline').removeClass("expanded");
    $('.expand-btn').removeClass("squared");
  });
  $('.sidebar-right').on('click', '.expand-btn', function () {
    $('.event-card').toggleClass("big");
    $('.card-image').toggleClass("big");
    $('.card-image figure').toggleClass("big");
    $('.card-image figure img').toggleClass("big");
    $('.card-content').toggleClass("big");
    $('.tagline').toggleClass("big");
    $('.expand-btn').toggleClass("big");


  });
  window.makeCardSmall = function makeCardSmall() {
    $('.event-card').removeClass("big");
    $('.card-image').removeClass("big");
    $('.card-image figure').removeClass("big");
    $('.card-image figure img').removeClass("big");
    $('.card-content').removeClass("big");
    $('.tagline').removeClass("big");
    $('.expand-btn').removeClass("big");

  };

  $('.create-activity-button').click(function () {
    $('.create-activity-modal').addClass('is-active');
    $('.modal').addClass('is-active');
  });
  $('#filter-button').click(function () {
    $('#filter-button').toggleClass('is-active');
    $('.filtercontainer').toggleClass('is-active');
    if ($('#filter-button').hasClass('is-active')) {
      $('.event-card').css('opacity', '0');
      $('.event-card').css('visibility', 'hidden');
    } else {
      $('.event-card').css('opacity', '1');
      $('.event-card').css('visibility', 'visible');
    }
  });
  $('.calendar-button').click(function () {
    $('.calendar-popout').toggleClass('is-active');
  });
  $('.profile-button').click(function () {
    $('.profile-button').toggleClass('is-active');
    $('.right-subcontainer').toggleClass('is-active');
    $('.calendar-popout').removeClass('is-active');
    $('.right-avatarswap-container').removeClass('is-active');
    $('.right-subcontainer').removeClass('bottom-square');
    $('.right-avatarswap-container').removeClass('bottom-square');
  });
  $('.change-avatar-button').click(function () {
    $('.right-avatarswap-container').toggleClass('is-active');
    $('.right-subcontainer').toggleClass('bottom-square');
    $('.right-avatarswap-container').toggleClass('bottom-square');
  });

  $('.modal-close').click(function () {
    $('.above-main').removeClass('is-active');
    $('.modal').removeClass('is-active');
    $('.activity-modal-content').empty();
    //Unbinding click events
    $('.mapboxgl-canvas').off('click');
  });
});

$(document).on('turbolinks:load', function () {  // SLIDER LOGIC
  var distance_slider = document.getElementById('distance');
  var price_slider = document.getElementById('price');
  var capacity_slider = document.getElementById('capacity');
  window.f_capacityVal = null;
  window.f_priceVal = null;
  window.f_distanceVal = null;

  // Update each slider value to match dragged slider position
  if (distance_slider) {
    distance_slider.oninput = function () {
      $('#distancevalue').html(this.value);
      window.f_distanceVal = this.value;
    };
  }
  if (price_slider) {
    price_slider.oninput = function () {
      $('#pricevalue').html(this.value);
      window.f_priceVal = this.value;
    };
  }
  if (capacity_slider) {
    capacity_slider.oninput = function () {
      $('#capacityvalue').html(this.value);
      window.f_capacityVal = this.value;

    };
  }
  //END SLIDER LOGIC
});

function setDark() {
  //root variable styles
  root.style.setProperty('--lbackground-primary', "#36393F");
  root.style.setProperty('--lbackground-secondary', "#2F3136");
  root.style.setProperty('--lbackground-tertiary', "#202225");
  root.style.setProperty('--lbackground-border', "#242529");

  root.style.setProperty('--ltext-primary', "#D1DDDE");
  root.style.setProperty('--ltext-secondary', "#769297");
  root.style.setProperty('--ltext-tertiary', "#FFFFFF");

  // $('.right-button').addClass('dark');
  // $('.panel').addClass('dark');
  // $('.panel-heading').addClass('dark');
  // $('.panel-subheading').addClass('dark');
  // $('.panel-tabs').addClass('dark');
  // $('.card.event-card').addClass('dark');
  // $('.tags').addClass('dark');
  // $('.slider').addClass('dark');
  // $('.filtercontainer').addClass('dark');
  if (window.mapjsReady) {
    window.mapDark();
  } else {
    setTimeout(() => {
      window.mapDark();
    }, 1000);
  }
}

function setLight() {

  root.style.setProperty('--lbackground-primary', "white");
  root.style.setProperty('--lbackground-secondary', "rgb(224, 224, 224)");
  root.style.setProperty('--lbackground-tertiary', "rgb(216, 216, 216)");
  root.style.setProperty('--lbackground-border', "lightgrey");

  root.style.setProperty('--ltext-primary', "#4A4A4A");
  root.style.setProperty('--ltext-secondary', "grey");
  root.style.setProperty('--ltext-tertiary', "black");

  window.mapLight();
  // $('.right-button').removeClass('dark');
  // $('.panel').removeClass('dark');
  // $('.panel-heading').removeClass('dark');
  // $('.panel-subheading').removeClass('dark');
  // $('.panel-tabs').removeClass('dark');
  // $('.card.event-card').removeClass('dark');
  // $('.tags').removeClass('dark');
  // $('.slider').removeClass('dark');
  // $('.filtercontainer').removeClass('dark');
}
