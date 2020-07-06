class Message < ApplicationRecord

  def new
    @messages = Message.new
  end  

  def create
    @messages = Message.create(msg_params)
    if @messages.save
      ActionCable.server.broadcast 'room_channel', content: @messages.content
    end
  end

  private  

  def msg_params
    params.require(:message).permit(:content)
  end
end
