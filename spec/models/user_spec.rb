require 'rails_helper'

RSpec.describe User, type: :model do
  it 'returns a response when asked for a photo' do
    user = User.new
    expect(user.get_photo_by_user(1)).to eq 'defaultprofile.jpg'
  end
end
