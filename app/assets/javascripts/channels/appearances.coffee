jQuery(document).on 'turbolinks:load', ->
  App.personal_chat = App.cable.subscriptions.create {
    channel: "AppearancesChannel"
  },
  connected: ->

  disconnected: ->

  received: (data) ->
    user = $(".user-#{data['user_id']}")
    user.toggleClass 'online', data['online']
    # adds or removes the online class:



# Basically, when a user subscribes to this channel, they are online.
