require 'rails_helper'

RSpec.describe ChatRoom, type: :model do
  it 'belongs to a user' do
    association = described_class.reflect_on_association(:user).macro
    expect(association).to eq :belongs_to
  end

  it 'is not valid unless it has a title' do
    room = described_class.new(title: nil)
    expect(room).not_to be_valid
  end
end
