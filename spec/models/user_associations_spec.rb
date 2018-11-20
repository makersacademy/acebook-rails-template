require 'rails_helper'

describe 'associations' do
  it 'belongs to users' do
    association = Post.reflect_on_association(:user)
    expect(association.macro).to eq :belongs_to
  end
end
