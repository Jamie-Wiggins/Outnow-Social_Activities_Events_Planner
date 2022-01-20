$(document).on('turbolinks:load', function () {
  window.updateScroll = function updateScroll() {
    var chat = document.getElementById('chat-container');
    chat.scrollTop = chat.scrollHeight;
  };
  var url = String(window.location.href);
  if (url.includes("chatrooms")) {
    window.updateScroll();
  }
});
