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

  context ": a new user, creating a post with an image, creates a new album:" do
    it "creates a new album the first time a user uploads an image" do
      sophiealbum = User.create!(email: "Sophie.Album@gmail.com", first_name: "Sophie", last_name: "Album", password: "sa1234")
      current_user = sophiealbum
      allow(current_user).to receive(:id).and_return(1)
      testpost = Post.create!(user_id: current_user.id, message: "Testing picture upload")
      phototest = Photo.create(image_file_name: "test.jpg", image_content_type: "image/jpg", user_id: current_user.id, post_id: testpost.id)
      expect(Album.default_album_exists?(current_user)).to eq true
    end
    it "assigns the album ID to the newly-uploaded picture" do
      sophiealbum = User.create!(email: "Sophie.Album@gmail.com", first_name: "Sophie", last_name: "Album", password: "sa1234")
      current_user = sophiealbum
      allow(current_user).to receive(:id).and_return(1)
      testpost = Post.create!(user_id: current_user.id, message: "Testing picture upload")
      phototest = Photo.create(image_file_name: "test.jpg", image_content_type: "image/jpg", user_id: current_user.id, post_id: testpost.id)
      expect(phototest.album_id).to eq(Album.users_default_album(current_user).id)
    end
  end
end
