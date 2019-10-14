class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.user = current_user
    if @message.save
      ActionCable.server.broadcast "chat-channel",
                                      content: @message.content
    else
    end
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end
end
