require 'rails_helper'
require 'database_cleaner'
DatabaseCleaner.strategy= :truncation

RSpec.describe PostsController, type: :controller do

      # assume a logged in user
    # when current_user is called return true
      let(:current_user) { User.create(user_params) }

      before do
        allow(@controller).to receive(:current_user).and_return(true)
      end

      describe "GET /new " do
        it "responds with 200" do
          get :new
          expect(response).to have_http_status(200)
        end
      end

    describe "POST /" do
      it "responds with 200" do
        DatabaseCleaner.clean
        post :create, params: { post: { message: "Hello, world!" } }
        expect(response).to redirect_to('http://test.host/posts/1')
      end
    end

      it "creates a post" do
        post :create, params: { post: { message: "Hello, world!" } }
        expect(Post.find_by(message: "Hello, world!")).to be
      end
    end

    # describe "GET /" do
    #   it "responds with 20ss0" do
    #     postcontroller=PostsController.new
    #     get :index
    #     expect(response).to have_http_status(200)
    #   end
    # end
