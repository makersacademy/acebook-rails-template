require 'rails_helper'

describe 'Wall' do

describe 'User Walls' do
  it 'has a user id' do
    wall = Wall.new(1)
    expect(wall.id).to eq(1)
  end
end

  # it 'contains wall posts' do
  #   wall = Wall.new()
  # end

end
