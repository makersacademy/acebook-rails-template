require 'rails_helper'

RSpec.describe LikesController, type: :controller do

  before(:each) do
    request.env["HTTP_REFERER"] = root_url
    @user = User.new(:email => 'el@el.com', :password => '1234567')
    @user.save
    @post = Post.new(:description => 'content')
    @post.save
  end

  describe "POST #reate" do
    it "creates a new like" do
    end
  end


end
