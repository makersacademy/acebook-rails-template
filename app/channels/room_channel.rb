class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
  end

  def speak(data)
    current_user.messages.create(content: data['message'])
  end

end
