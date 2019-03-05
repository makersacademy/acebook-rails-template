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

  context "#users_first_album" do
    it "returns the ID of the user's first album" do
      sophiealbum = User.create!(email: "Sophie.Album@gmail.com", first_name: "Sophie", last_name: "Album", password: "sa1234")
      current_user = double("current_user")
      allow(current_user).to receive(:id).and_return(1)
      Album.create(id: 1, title: "sophies_photos", user_id: 1)
      Album.create(title: "sophies_photos2", user_id: 1)
      Album.create(title: "sophies_photos3", user_id: 1)
      expect(Album.users_first_album(current_user).id).to eq(1)
    end
  end

  context "a new user, creating a post with an image, creates a new album" do
    it "creates a new album the first time a user uploads an image" do
      sophiealbum = User.create!(email: "Sophie.Album@gmail.com", first_name: "Sophie", last_name: "Album", password: "sa1234")
      current_user = double("current_user")
      allow(current_user).to receive(:id).and_return(1)
      testpost = Post.create!(user_id: current_user.id, message: "Testing picture upload")
      phototest = Photo.create(image_file_name: "test.jpg", image_content_type: "image/jpg", user_id: current_user.id, post_id: testpost.id)
      expect(Album.album_exists?(current_user)).to eq true
    end
    it "assigns the album ID to the newly-uploaded picture" do
      sophiealbum = User.create!(email: "Sophie.Album@gmail.com", first_name: "Sophie", last_name: "Album", password: "sa1234")
      current_user = double("current_user")
      allow(current_user).to receive(:id).and_return(1)
      testpost = Post.create!(user_id: current_user.id, message: "Testing picture upload")
      phototest = Photo.create(image_file_name: "test.jpg", image_content_type: "image/jpg", user_id: current_user.id, post_id: testpost.id)
      expect(phototest.album_id).to eq(Album.users_first_album(current_user).id)
    end
  end
end
