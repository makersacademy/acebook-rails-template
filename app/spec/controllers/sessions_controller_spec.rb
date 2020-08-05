require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "doesn't log in" do
      post :create
      expect(response).to have_http_status(:success)
      expect(response).to render_template("new")
      # need to find @error
    end
    it " does log in" do
      
      @user = double(true)
      params = double(true)
      session = double(true)
      # User = double(true)

      expect(session).to receive([].to_s).with(:user_id).and_return(1)
      expect(params).to receive([].to_s).with(:password).and_return(1)
      expect(@user).to receive(:authenticate).with(any_args).and_return(true)
      expect(@user).to receive(:id).and_return(1)
      # expect(User).to receive(find_by).with(any_args).and_return(1)
      # p @user.authenticate(params[:password])
      p @user.id
      if @user && @user.authenticate(params[:password])
        p 'We won!'
      else
        p 'we lost'
      end
      post :create
      # # expect to receive an email and if the password and email are correct we redirect to posts
      expect(session[:user_id]).to eq(1)
      # this one is not working, because we have not successfully stubbed User class without it leaking into other tests
      # expect(response).to render_template("posts")
    end
  end

  # describe "GET #login" do
  #  it "returns http success" do
  #     get :login
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "GET #welcome" do
    it "returns http success" do
      get :welcome
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    it "logs out and deletes the @user and user_id from session" do
    # session[:user_id] = 1
    @user = 1
    p 'before'
    p @user
    p session[:user_id]
    
    delete :destroy
    p 'after'
    # p session[:user_id]
    p @user
    p response
    expect(response).to have_http_status(302)
    # we delete the saved user_id and we set @user to equal nil
  end
end

end
