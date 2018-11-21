require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'belongs to a user' do
    association = described_class.reflect_on_association(:user).macro
    expect(association).to eq :belongs_to
  end

  it 'belongs to a post' do
    association = described_class.reflect_on_association(:post).macro
    expect(association).to eq :belongs_to
  end
end
