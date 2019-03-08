require 'rails_helper'

RSpec.describe Album, type: :model do

  context "#default_album_exists?" do
    it "returns true if default album exists" do
      sophiealbum = User.create!(email: "Sophie.Album@gmail.com", first_name: "Sophie", last_name: "Album", password: "sa1234")
      current_user = sophiealbum
      allow(current_user).to receive(:id).and_return(1)
      Album.create(title: "#{current_user.first_name}'s Photos", user_id: 1)
      expect(Album.default_album_exists?(current_user)).to eq true
    end
  end

  context "#users_default_album" do
    it "returns the ID of the user's default album" do
      sophiealbum = User.create!(email: "Sophie.Album@gmail.com", first_name: "Sophie", last_name: "Album", password: "sa1234")
      current_user = sophiealbum
      allow(current_user).to receive(:id).and_return(1)
      not_default_album = Album.create(title: "Not Default", user_id: 1)
      default_album_test = Album.create(title: "Sophie's Photos", user_id: 1)
      Album.create(title: "Sophie's Holidays", user_id: 1)
      expect(Album.users_default_album(current_user).id).to eq(default_album_test.id)
    end
    it ": can match the name of the user's default album in preparation for upload" do
      sophiealbum = User.create!(email: "Sophie.Album@gmail.com", first_name: "Sophie", last_name: "Album", password: "sa1234")
      current_user = sophiealbum
      allow(current_user).to receive(:id).and_return(1)
      Album.create(title: "#{sophiealbum.first_name}'s Photos", user_id: 1)
      expect(Album.users_default_album(current_user).title).to eq("Sophie's Photos")
    end
  end  
end
