
App.chatChannel = App.cable.subscriptions.create { channel: "ChatChannel", room: "Group Chat"},
  received: (data) ->
    @appendLine(data)

  appendLine: (data) ->
    html = @createLine(data)
    $("[data-chat-room='Group Chat']").append(html)

  createLine: (data) ->
    """
    <article class="chat-line">
      <span class="speaker">#{data["sent_by"]}</span>
      <span class="body">#{data["body"]}</span>
    </article>
    """

App.chatChannel.send({ sent_by: "Paul", body: "This is a cool chat app." })
