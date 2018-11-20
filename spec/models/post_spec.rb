require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'belongs to a user' do
    association = described_class.reflect_on_association(:user).macro
    described_class.reflect_on_association(:user)
    expect(association).to eq :belongs_to
  end
end
