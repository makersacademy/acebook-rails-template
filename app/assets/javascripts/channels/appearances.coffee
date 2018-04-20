jQuery(document).on 'turbolinks:load', ->
  App.personal_chat = App.cable.subscriptions.create {
    channel: "AppearancesChannel"
  },
  connected: ->

  disconnected: ->

  received: (data) ->

# Basically, when a user subscribes to this channel, they are online.
