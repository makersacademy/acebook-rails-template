App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    $('#message').append('<div class="message">' + data.content + '</div>')
  },

  speak: function(message) {
    // @perform 'speak', message: message
    // $(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
    //  if event.keyCode is 13 # return = send
    //    App.room.speak event.target.value
    //    event.target.value = ""
    //    event.preventDefault()
  }
});
