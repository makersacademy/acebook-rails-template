require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "works! (now write some real specs)" do
      sign_in User.find_by_id(User.first.id)
      get posts_path
      expect(response).to have_http_status(200)
    end
  end

  it 'accepts HTTP requests to DELETE /posts/id' do
    sign_in User.find_by_id(User.first.id)
    User.first.posts.create({ message: "Hhhh", wall: User.first.id })
    delete "/posts/#{User.first.posts.first.id}"
    expect(response).to have_http_status(302)
  end

  describe 'GET /:wall' do
    it "responds with 200" do
      sign_in User.find_by_id(User.first.id)
      get '1'
      expect(response).to have_http_status(200)
    end
  end
end
