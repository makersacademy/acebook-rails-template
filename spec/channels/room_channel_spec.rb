require "rails_helper"

RSpec.describe RoomChannel, type: :channel do
  before do
    stub_connection user_id: user.id
  end

  it "redirects when not logged in", :focus => true do
    subscribe
    assert_no_streams  
  end

  xit "subscribes to a stream when room id is provided" do
    subscribe(room_id: 42)

    expect(subscription).to be_confirmed
    expect(streams).to include("chat_42")
  end
end
