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
    expect(message.timestamp).to eq time.strftime('%H:%M %d %B')
  end

  it 'is invalid if created without a body' do
    expect(Message.new(body: nil)).not_to be_valid
  end
end
