App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {
  },

  disconnected: function() {
  },

  received: function(data) {
    return $('#messages').prepend(data['message']);
  },

  speak: function(message) {
    return this.perform('speak', {
      message: message
    });
  }
});


document.addEventListener("DOMContentLoaded", function(event) { 
  $(function(){
      $(document).on('keypress', '[data-behavior~=room_speaker]', function(event) {
        if (event.keyCode === 13)  {
          App.room.speak(event.target.value);
          event.target.value = '';
          return event.preventDefault();
        }
      });
      $('#add_message').submit(function(event) {
          console.log(event)
          App.room.speak(event.target[0].value);
          event.target.value = '';
          return event.preventDefault();
      });
  });
});

