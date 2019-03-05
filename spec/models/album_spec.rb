require 'rails_helper'

RSpec.describe Album, type: :model do

  context "#album_exists?" do
    it "returns true if album exists" do
      sophiealbum = User.create!(email: "Sophie.Album@gmail.com", first_name: "Sophie", last_name: "Album", password: "sa1234")
      current_user = double("current_user")
      allow(current_user).to receive(:id).and_return(1)
      Album.create(title: "sophies_photos", user_id: 1)
      expect(Album.album_exists?(current_user)).to eq true
    end
  end

end
