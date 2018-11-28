require 'rails_helper'

RSpec.describe Message, type: :model do
  it 'belongs to a user' do
    association = described_class.reflect_on_association(:user).macro
    expect(association).to eq :belongs_to
  end

  it 'belongs to a chat room' do
    association = described_class.reflect_on_association(:chat_room).macro
    expect(association).to eq :belongs_to
  end

  it 'can have a timestamp' do
    message = Message.new(body: 'Messagetest', created_at: Time.now)
    time = message.created_at
    expect(message.timestamp).to eq time.strftime('%H:%M')
  end

  it 'is invalid if created without a body' do
    expect(Message.new(body: nil, user: create(:user), chat_room: create(:chat_room))).not_to be_valid
  end

  it 'is invalid if created with a body of length 1001' do
    body = ''
    1001.times { body << 'hi' }
    expect(Message.new(body: body, user: create(:user), chat_room: create(:chat_room))).not_to be_valid
  end

  it 'is valid if created with a body of length 1' do
    expect(Message.new(body: 'a', user: create(:user), chat_room: create(:chat_room))).to be_valid
  end
end
