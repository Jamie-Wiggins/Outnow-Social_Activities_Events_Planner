import consumer from './consumer';

var chat = consumer.subscriptions.create('MessagesChannel', {
  connected() { },

  disconnected() {
  },

  received(data) {
    console.log(data);
    var active = $("[data-behavior='messages'][data-chatroom-id='" + data.chatroom_id + "']");
    var test =  $("[data-behavior='messages'][data-chatroom-id='" + data.chatroom_id + "']").data('user');
    console.log("current user" + Number(test));
    console.log("sender"+data.sender);

    const leftapp = $('.left-dix');
    const rightapp = $('.right-dix');

    if (active.length > 0) {
      
      if (Number(test) === Number(data.sender)) {
        console.log("success")
        // when current user is the user that sent the message
        rightapp.append(data.message);
        leftapp.append("<div class='msg-spacer'></div>");
      } else {
        console.log("fails")
        // when current user is the user dis not sent the message
        leftapp.append(data.message);
        rightapp.append("<div class='msg-spacer'></div>");
      }
    }
    window.updateScroll();

  },

  send_message(chatroom_id, message) {
    //console.log(message);
    this.perform('send_message', { chatroom_id: chatroom_id, body: message });
  },
});

var submit_message;

$(document).on('turbolinks:load', function () {
  submit_message();
});

submit_message = function () {
  $('#new_message').on('keydown', function (e) {
    if (e.keyCode === 13) {
      var body, chatroom_id;
      e.preventDefault();
      console.log('SUBMITTEDD');
      chatroom_id = $("[data-behavior='messages']").data('chatroom-id');
      body = $('#message_body');
      console.log('Chatroom ID: ' + chatroom_id);
      console.log('Messages: ' + body.val());
      chat.send_message(chatroom_id, body.val());
      body.val(' ');
    }
  });

  $('#button_message').click(function (e) {
    var body, chatroom_id;
    e.preventDefault();
    console.log('SUBMITTEDD');
    chatroom_id = $("[data-behavior='messages']").data('chatroom-id');
    body = $('#message_body');
    console.log('Chatroom ID: ' + chatroom_id);
    console.log('Messages: ' + body.val());
    chat.send_message(chatroom_id, body.val());
    body.val(' ');
  });
};
// highlitgh when new message and append to left side
