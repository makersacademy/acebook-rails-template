require 'rails_helper'

describe 'associations' do
  it 'has many posts' do
    association = User.reflect_on_association(:posts)
    expect(association.macro).to eq :has_many 
  end
end
