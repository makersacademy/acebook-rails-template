require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "POST /create" do

    before do 
      @test_person = FactoryBot.create(:user)
      post '/posts', params: { 
        post: { 
          message: "Hello Planet!", 
          user_id: @test_person.id 
          }
        }
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
      @test_person = FactoryBot.create(:user)
      add_posts(@test_person)
      get '/posts'
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
      @post_test_person = FactoryBot.create(:user)
      add_posts(@post_test_person)
      get '/posts'
      @post_id_test = JSON.parse(response.body)['posts'][0]["id"]
      post '/like_post', params: { post: { id: @post_id_test, user_id: @post_test_person.id } }
    end

    it 'has a status of :like_created' do
      expect(JSON.parse(response.body)['status']).to eq 'like_created'
    end

    it 'counts number of likes' do
      expect(JSON.parse(response.body)['like_count']).to eq 1
    end

    it 'returns likes when count is above one' do
      post "/log_out"
      test_person_2 = {
        name: "Test Person", 
        email: "test1@testing.com", 
        password: "123456", 
        password_confirmation: "123456" 
      }
      post '/users', params: {user: test_person_2}
      @user_id_test_2 = JSON.parse(response.body)['user']["id"]
      post '/like_post', params: { post: { id: @post_id_test, user_id: @user_id_test_2 } }
      expect(JSON.parse(response.body)['like_count']).to eq 2
    end


    it 'returns a post that was liked' do
      expect(JSON.parse(response.body)["post"]["id"]).to eq @post_id_test
    end

    it "returns unprocessable_entity when post can't be liked" do
      post '/like_post', params: { post: { id: "0", user_id: @post_test_person.id } }
      expect(JSON.parse(response.body)["status"]).to eq "unprocessable_entity"
    end

   
  end

  describe "POST /posts#comment" do

    before do
      @post_test_person = FactoryBot.create(:user)
      add_posts(@post_test_person)
      get '/posts'
      @post_id = JSON.parse(response.body)['posts'][0]["id"]
      post '/posts#comment', params: { post: { id: @post_id, message: "Hello London!",user_id: @post_test_person.id } }
    end

    it "has a status of created" do
      expect(JSON.parse(response.body)["status"]).to eq "created"
    end

    it 'returns a post that was commented' do
      puts "---------TEST--------"
      p JSON.parse(response.body)
      puts "---------TEST--------"
      
      expect(JSON.parse(response.body)["post"]["id"]).to eq @post_id
    end



  end





end

