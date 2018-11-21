require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'belongs to a user' do
    association = described_class.reflect_on_association(:user).macro
    expect(association).to eq :belongs_to
  end

  it 'has many comments' do
    association = described_class.reflect_on_association(:comments).macro
    expect(association).to eq :has_many
  end
end
