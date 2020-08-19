require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'should save the user_id of the user that created the post' do
    user = User.create(email: 'a@a.com',password: 'thisisnot')
    post = Post.create(message: 'this is a message', user_id: user.id)

    expect(post.user_id).to equal(user.id)
  end
end
