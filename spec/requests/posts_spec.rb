require 'rails_helper'

RSpec.describe "Posts", type: :request do
  before :each do
    @test_person = FactoryBot.create(:user)
    token = JsonWebToken.encode(user_id: @test_person.id)
    @headers = { "Authorization" => token }
  end

  describe "POST /create" do
    before do 
      post '/posts', params: { 
        post: { 
          message: "Hello Planet!", 
          user_id: @test_person.id 
          }
        },
        headers: @headers
    end

    it "has a status of created" do
      expect(JSON.parse(response.body)['status']).to eq "created"
    end

    it "returns the post" do
      expect(JSON.parse(response.body)['post']['message']).to eq "Hello Planet!"
    end

    it 'returns a user object' do
      expect(JSON.parse(response.body)['post']['user_id']).to eq @test_person.id
    end
  end

  describe 'GET /index' do 

    before do
      add_posts(@test_person, @headers)
      get '/posts', headers: @headers
    end

    it "returns posts" do
      expect(JSON.parse(response.body)['posts']).to be
    end

    it "returns all posts" do
      expect(JSON.parse(response.body)['posts'].count).to eq 4
    end

    it "returns posts in descending order" do
      expect(JSON.parse(response.body)['posts'][0]["message"]).to eq "Hello Planet 4!"
      expect(JSON.parse(response.body)['posts'][1]["message"]).to eq "Hello Planet 3!"
      expect(JSON.parse(response.body)['posts'][2]["message"]).to eq "Hello Planet 2!"
      expect(JSON.parse(response.body)['posts'][3]["message"]).to eq "Hello Planet 1!"
    end
  end

  describe 'POST /like' do

    before do
      add_posts(@test_person, @headers)
      get '/posts', headers: @headers
      @post_id = JSON.parse(response.body)['posts'][0]["id"]
      post '/like_post', params: { post: { id: @post_id, user_id: @test_person.id } }, headers: @headers
    end

    it 'has a status of :like_created' do
      skip
      expect(JSON.parse(response.body)['status']).to eq 'like_created'
    end

    it 'counts number of likes' do
      skip
      expect(JSON.parse(response.body)['like_count']).to eq 1
    end

    it 'returns likes when count is above one' do
      skip
      post "/log_out"
      test_person_2 = {
        name: "Test Person", 
        email: "test1@testing.com", 
        password: "123456", 
        password_confirmation: "123456" 
      }
      post '/users', params: {user: test_person_2}
      test_person_2 = JSON.parse(response.body)['user']
      token_2 = JsonWebToken.encode(user_id: test_person_2['id'])

      post '/like_post', params: { post: { id: @post_id, user_id: test_person_2['id'] } }, headers: {Authorization: token_2}
      expect(JSON.parse(response.body)['like_count']).to eq 2
    end

    it 'returns a post that was liked' do
      skip
      expect(JSON.parse(response.body)["post"]["id"]).to eq @post_id
    end

    it "returns unprocessable_entity when post can't be liked" do
      post '/like_post', params: { post: { id: "0", user_id: @test_person.id } }, headers: @headers
      expect(JSON.parse(response.body)["status"]).to eq "unprocessable_entity"
    end
  end

  describe "POST /posts#comment" do

    before do
      add_posts(@test_person, @headers)
      get '/posts', headers: @headers
      @post_id = JSON.parse(response.body)['posts'][0]["id"]
      # add_custom_comment(user:@test_person, comment:"Hello! I'm a comment!", post_id: @post_id, headers: @headers)
    end

    it "has a status of created" do
      skip
      expect(JSON.parse(response.body)["status"]).to eq "created"
    end

    it 'returns the post that was commented on' do
      skip
      expect(JSON.parse(response.body)["post"]["id"]).to eq @post_id
    end

    it "returns the posts' comments" do
      skip
      expect(JSON.parse(response.body)["comments"].count).to eq 1
      expect(JSON.parse(response.body)["comments"][0]["comment_text"]).to eq "Hello! I'm a comment!"
    end

    it "returns the posts' comments in reverse order" do
      skip
      add_custom_comment(user:@test_person, comment:"Hello! I'm the SECOND comment!", post_id:@post_id, headers: @headers)
      add_custom_comment(user:@test_person, comment:"Hello! I'm the THIRD comment!", post_id:@post_id, headers: @headers)
      add_custom_comment(user:@test_person, comment:"Hello! I'm the FOURTH comment!", post_id:@post_id, headers: @headers)

      expect(JSON.parse(response.body)["comments"].count).to eq 4
      expect(JSON.parse(response.body)["comments"][0]["comment_text"]).to eq "Hello! I'm the FOURTH comment!"
      expect(JSON.parse(response.body)["comments"][1]["comment_text"]).to eq "Hello! I'm the THIRD comment!"
      expect(JSON.parse(response.body)["comments"][2]["comment_text"]).to eq "Hello! I'm the SECOND comment!"
      expect(JSON.parse(response.body)["comments"][3]["comment_text"]).to eq "Hello! I'm a comment!"
    end
  end
end

