require 'rails_helper'

RSpec.describe SessionsHelper do
  describe "#current_user" do
    it "creates current_user variable based on user id" do
      user = double("User", :id => 123)
      session[:user_id] = user.id
      # mocking the @current user in the sessions helper
      @current_user = user
      expect(current_user).to eq(user)
    end
  end

    describe "#current_user" do
    it "it creates a current user from the database" do
      user = double("User", :id => 123)
      session[:user_id] = user.id
      # mocking a database object in the sessions helper.
      User = class_double("User")
      allow(User).to receive(:find_by).with(id: session[:user_id]).and_return(user)
      expect(current_user).to eq(user)
    end
  end
end
