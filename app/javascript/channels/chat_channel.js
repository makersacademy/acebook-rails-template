import consumer from "./consumer"

consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log('connected to chat channel');
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log('disconnected from chat channel');
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    // console.log(`receiving: ${data}`)
    $('#message_body').val('');
    var messages = $('#chatbox');
    messages.prepend(data['message']);
  }
});
