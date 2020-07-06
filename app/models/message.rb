class Message < ApplicationRecord

  def new
    @message = Message.new
  end  

  def create
    @message = Message.create(msg_params)
  end

  private  

  def msg_params
    params.require(:message).permit(:content)
  end
end