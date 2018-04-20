# frozen_string_literal: true

class AppearancesChannel < ApplicationCable::Channel
  def subscribed
    redis.set("user_#{current_user.id}_online", '1')
    stream_from('appearances_channel')
    ActionCable.server.broadcast 'appearances_channel',
                                 user_id: current_user.id,
                                 online: true
  end
  # Once someone is subscribed, set “user_SOME_ID_online” to “1” in Redis. Then start streaming and broadcast a message saying that a user is now online.

  def unsubscribed
    redis.del("user_#{current_user.id}_online")
    ActionCable.server.broadcast 'appearances_channel',
                                 user_id: current_user.id,
                                 online: false
  end
  # When a user unsubscribes, we delete the “user_SOME_ID_online” key and once again broadcast a message. Pretty simple, really.

  private

  def redis
    Redis.new
  end
end
