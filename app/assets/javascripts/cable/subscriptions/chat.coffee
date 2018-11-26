
App.chatChannel = App.cable.subscriptions.create { channel: "ChatChannel", room: "Group Chat"},
  received: (data) ->
    @appendLine(data)

  appendLine: (data) ->
    html = @createLine(data)
    # $("[data-chat-room='Group Chat']").append(html)

    $("#chat-box").append(html)

  createLine: (data) ->
    """
    <article>
      <div class="chat-line border border-primary rounded">
        <span class="speaker">#{data["sent_by"]}</span><br>
        <span class="body">#{data["body"]}</span>
      </div>
    </article>
    """

App.chatChannel.send({ sent_by: "Paul", body: "This is a cool chat app." })
