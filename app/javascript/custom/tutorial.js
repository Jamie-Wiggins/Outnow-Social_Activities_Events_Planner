$(document).on('turbolinks:load', function () {
    $('.tutorial-btn').click(window.runTutorial);
});
var tutorialStarted = false;
var step = 1;
window.runTutorial = function runTutorial() {
    console.log("Beginning Tutorial...");
    tutorialStarted = true;
    //
    window.sidebar_open = true;
    $('.sidebar-left').addClass("expanded");
    $('.tutorial-btn').html("Tutorial in Progress...")
    $('.tutorial-btn').addClass("is-info");
    $('.tutorial-btn').prop('disabled', true);
    $('.tutorial-btn').css("margin-top", "auto");
    $('.tutorial-btn').css("margin-bottom", "100px");
    //
    $('.tutorial-bottom-wrapper').css("visibility", "visible");
    $('.screen-occluder').css("visibility", "visible");
    $(".next-btn").unbind("click");
    nextStep();
    $(".next-btn").click(function () {
        step += 1;
        nextStep();
        $('.next-btn').prop('disabled', true);
        setTimeout(() => {
            $('.next-btn').prop('disabled', false);
        }, 1000);
    });
    //

}
function nextStep() {
    switch (step) {
        case 1:
            $('.explanation').html("To create an activity, start with the 'Create Activity' button. This will open a form for making a new activity.");
            $('.explanation').css("animation", "bounce 1s linear");
            $('.create-activity-button').addClass("animated33")
            $('.create-activity-button').css("background-size", "300% 300%");
            $('.create-activity-button').css("animation", "rubberBand 1s linear");
            setTimeout(() => {
                $('.create-activity-button').css("animation", "none");
            }, 2000);
            setTimeout(() => {
                $('.create-activity-button').css("animation", "bgscroller 2s ease infinite");
            }, 2000);
            break;
        case 2:
            $('.explanation').html("To search for an activity, use the search box on the map. Try typing in keywords such as 'football' or 'reading' and see if anything comes up!");
            $('.explanation').css("animation", "none");
            setTimeout(() => {
                $('.explanation').css("animation", "bounce 1s linear");
            }, 100);
            $('.create-activity-button').removeClass("animated33")
            $('.create-activity-button').css("background-size", "100% 100%");
            $('.create-activity-button').css("animation", "none");
            //
            $('.mapboxgl-ctrl-geocoder--input').css("background", "linear-gradient(270deg, #ff0000, #ffab00, #fffa00)");
            $('.mapboxgl-ctrl-geocoder--input').css("background-size", "300% 300%");
            $('.mapboxgl-ctrl-geocoder--input').css("animation", "rubberBand 1s linear");
            setTimeout(() => {
                $('.mapboxgl-ctrl-geocoder--input').css("animation", "none");
            }, 2000);
            setTimeout(() => {
                $('.mapboxgl-ctrl-geocoder--input').css("animation", "bgscroller 2s ease infinite");
            }, 2000);
            break;
        case 3:
            $('.explanation').html("To change your avatar, access more profile-related options, switch to dark mode or view your personal activity calendar, click on your avatar in the top right.");
            $('.explanation').css("animation", "none");
            setTimeout(() => {
                $('.explanation').css("animation", "bounce 1s linear");
            }, 100);
            $('.mapboxgl-ctrl-geocoder--input').css("background", "white");
            $('.mapboxgl-ctrl-geocoder--input').css("background-size", "100% 100%");
            $('.mapboxgl-ctrl-geocoder--input').css("animation", "none");
            //
            $('.profile-button').css("background", "linear-gradient(270deg, #ff0000, #ffab00, #fffa00)");
            $('.profile-button').css("background-size", "300% 300%");
            $('.profile-button').css("animation", "rubberBand 1s linear");
            setTimeout(() => {
                $('.profile-button').css("animation", "none");
            }, 2000);
            setTimeout(() => {
                $('.profile-button').css("animation", "bgscroller 2s ease infinite");
            }, 2000);
            break;
        case 4:
            $('.explanation').html("Now that you know the basics, go find an activity to join! Click a pin on the map and press the button in its' image to expand the activity's card - then you can sign up! <br/> You'll see a chat button appear on the left of your screen.");
            $('.explanation').css("animation", "none");
            setTimeout(() => {
                $('.explanation').css("animation", "bounce 1s linear");
            }, 100);
            $('.profile-button').css("background", "rgba(0,0,0,0)");
            $('.profile-button').css("background-size", "100% 100%");
            $('.profile-button').css("animation", "none");
            //
            $(".next-btn").html("Click me to end the tutorial")
            $(".next-btn").unbind("click");
            $(".next-btn").click(function () {
                step = 1;
                console.log("Ending Tutorial...");
                tutorialStarted = false;
                //
                $(".next-btn").html("Next Tip")
                $('.tutorial-btn').html("Press me for a tutorial")
                $('.tutorial-btn').removeClass("is-info");
                $('.tutorial-btn').prop('disabled', false);
                $('.tutorial-btn').css("margin-top", "0");
                //
                $('.tutorial-bottom-wrapper').css("visibility", "hidden");
                $('.screen-occluder').css("visibility", "hidden");
                $('.explanation').html("");
            })
            break;
    }
}