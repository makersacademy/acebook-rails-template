require "rails_helper"


RSpec.describe RoomChannel, type: :channel do
  # before do
    # initialize connection with identifiers
  #   stub_connection user_id: user.id
  # end

  xit "rejects when no room id" do
    subscribe
    expect(subscription).to be_rejected
  end

  xit "subscribes to a stream when room id is provided" do
    subscribe(room_id: 42)

    expect(subscription).to be_confirmed
    expect(streams).to include("chat_42")
  end
end