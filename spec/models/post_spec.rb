require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'creates a new post' do
    user = User.create(username: "test", email: "test@test.com", password_digest: "test123", bio: "testing since before I could test", profile_picture: "test")
    post = Post.create(user_id: user.id, body: "I love testing posts")
    expect(post.body).to eq("I love testing posts")
  end

end
