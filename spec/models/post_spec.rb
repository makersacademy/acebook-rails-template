require 'rails_helper'

RSpec.describe Post, type: :model do

  it 'Post is an instance of the Post class' do
    post = Post.new
     expect(post).to be_an_instance_of (Post)
   end
end
