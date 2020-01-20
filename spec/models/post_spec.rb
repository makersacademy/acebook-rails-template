require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @user = User.create(
      first_name: 'Harry',
      surname: 'Mumford',
      email: 'harry_mumford@hotmail.co.uk',
      password: 'password'
    )
  end

  it 'returns true if post created within 10mins' do
    post = @user.posts.create(message: 'I am a post')

    expect(post.recent?).to be(true)
  end

  it 'returns false if post created after 10mins' do
    post_time = Time.local(2020, 1, 1, 0, 0, 0)
    Timecop.freeze(post_time)
                
    post = @user.posts.create(message: 'I am a post')

    edit_time = Time.local(2020, 1, 1, 0, 10, 0)
    Timecop.freeze(edit_time)

    expect(post.recent?).to be(false)
  end
end