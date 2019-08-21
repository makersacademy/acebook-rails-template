require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }

  def helper
    10.times do
      puts ""
    end
  end

  def create_post
    user_params = {"firstname"=>"Kay", "lastname"=>"Mo", "email"=>"k@mo.com", "password"=>"password"}
    current_user = User.create(user_params)
    post_params = {"message"=>"this is a test message"}
    post = current_user.posts.build(post_params)
    post.save
    return post
  end
  describe ".create" do
    it "stores a newly created post in database" do
      post = create_post
      post_id = post.id
      test_post = Post.find_by(id: post_id)
      expect(post).to eq test_post
    end
  end

  describe ".update" do
    it "updates a post content" do
      post = create_post
      new_params = {"message"=>"this is an updated message"}
      post_id = post.id
      Post.update(post_id, new_params)
      new_post = Post.find_by(id: post_id)
      expect(new_post.message).to eq "this is an updated message"
    end
  end

  describe ".destroy" do
    it "deletes a post from database" do
      post = create_post
      post_id = post.id
      post.destroy
      expect(Post.find_by(id: post_id)).to eq nil
    end
  end

  describe ".createURL" do
    it "should have a url in the post"
    user_params = {"firstname"=>"Kay", "lastname"=>"Mo", "email"=>"k@mo.com", "password"=>"password"}
    current_user = User.create(user_params)
    post_params = {"message"=>"this is a test message", "wall_id" => "1"}
    post = current_user.posts.build(post_params)
    post.save
    return post
    expect(post.wall_id).to eq "1"
  end
end
