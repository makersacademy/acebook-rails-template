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


  # def index
  #   @posts = Post.order("created_at Desc").all
  #   if @posts
  #     render json: {
  #       status: :created,
  #       posts: @posts
  #     }
  #   else
  #     render json: {
  #       status: :unprocessable_entity
  #     }
  #   end
  # end
end

def add_posts(test_person)
  post '/posts', params: { 
    post: { 
      message: "Hello Planet 1!", 
      user_id: test_person.id 
      }
    }
  post '/posts', params: { 
    post: { 
      message: "Hello Planet 2!", 
      user_id: test_person.id 
      }
    }
  post '/posts', params: { 
    post: { 
      message: "Hello Planet 3!", 
      user_id: test_person.id 
      }
    }
  post '/posts', params: { 
    post: { 
      message: "Hello Planet 4!", 
      user_id: test_person.id 
      }
    }
end