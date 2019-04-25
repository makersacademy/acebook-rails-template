require 'rails_helper'

RSpec.describe SessionsHelper do
  describe "#log_in" do
    it "creates a session id" do
      user = double("User", :id => 123)
      login(user)
      expect(session[:user_id]).to eq(123)
    end
  end
 describe "#current_user" do
    it "creates current_user variable based on user id " do
      user = double("User", :id => 123)
      login(user)
      expect(session[:user_id]).to eq(123)
    end
end
