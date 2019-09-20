require "rails_helper"

RSpec.describe Post, type: :model do
  it { is_expected.to be }

  it "creates a post" do
    user = User.create(email: "new@gmail.com", password: "password", password_confirmation: "password")
    Post.create(user_id: user.id, message: "Hello, world!")
    expect(Post.find_by(message: "Hello, world!")).to be
  end

  it "deletes a post" do
    user = User.create(email: "new@gmail.com", password: "password", password_confirmation: "password")
    Post.create(user_id: user.id, message: "Hello, world!")
    expect(Post.find_by(message: "Hello, world!")).to be
    post =  Post.find_by(message: "Hello, world!")
    post.delete
    expect(Post.find_by(message: "Hello, world!")).not_to be
  end

  it "updates a post" do
    user = User.create(email: "new@gmail.com", password: "password", password_confirmation: "password")
    Post.create(user_id: user.id, message: "Hello, world!")
    expect(Post.find_by(message: "Hello, world!")).to be
    post =  Post.find_by(message: "Hello, world!")
    post.update(message: "Goodbye, world!")
    expect(Post.find_by(message: "Hello, world!")).not_to be
    expect(Post.find_by(message: "Goodbye, world!")).to be
  end
end
