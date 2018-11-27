$ ->
  messages = $('#messages')
  if $('#messages').length > 0
    messages_to_bottom = -> messages.scrollTop(messages.prop("scrollHeight"))
    messages_to_bottom()
    App.global_chat = App.cable.subscriptions.create {
      channel: 'ChatRoomsChannel',
      chat_room_id: messages.attr('chat-room-id')
    },

    received: (data) ->
      messages.append data['message']
      messages_to_bottom()

    send_message: (message, chat_room_id) ->
      @perform 'send_message', message: message, chat_room_id: chat_room_id

    $('#new_message').submit (event) ->
      $this = $(this)
      textarea = $this.find('#message_body')
      if $.trim(textarea.val()).length > 1
        App.global_chat.send_message textarea.val(), messages.attr('chat-room-id')
        textarea.val('')
      event.preventDefault()
      return false
