class ChatsController < ApplicationController

  def create
    Chat.create(chat_params)
    room = "Group Chat"
    ActionCable.server.broadcast(
      "chat_#{room}",
      sent_by: current_user.name,
      body: chat_params[:message]
    )
  end

  

  def chat_params
    params.require(:chat).permit(:message).merge(user_id: current_user.id)
  end

end
