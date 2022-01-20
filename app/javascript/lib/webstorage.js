//This file handles all web storage related functions. It replaces the functionality of cookies.

//FUNCTIONS START
if (!localStorage.getItem('theme')) {
  populateStorage();
}

function populateStorage() {
  localStorage.setItem('theme', 'light');
}

//Function for other js files to call that sets a value in web storage
window.storeData = function storeData(name, value) {
  localStorage.setItem(name, value);
};

window.readData = function readData(name) {
  return localStorage.getItem(name);
};
//FUNCTIONS END

$(document).on('turbolinks:load', function () {
  //Retrieve cookie accepted state from browser
  var cookies_accepted = window.readData('cookies_accepted');
  //If no state has been set...
  if (cookies_accepted == null) {
    //Set default value (false)
    window.storeData('cookies_accepted', false);
    cookies_accepted = false;
    //If state is true...
  }
  if (cookies_accepted == 'true') {
    //Let user proceed to site
    $('.cookie_alert').css('display', 'none');
  }
  if (cookies_accepted == 'false') {
    // Else if cookies are not accepted, show cookie accepting notice
  }
  $('.acceptbtn').click(function () {
    cookies_accepted = true;
    window.storeData('cookies_accepted', true);
    $('.cookie_alert').css('display', 'none');
  });
});

console.log('webstorage loaded');

// export { storeData, readData };
