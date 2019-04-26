# frozen_string_literal: true

require "rails_helper"

RSpec.describe SessionsHelper do
  describe "#current_user" do
    it "creates current_user variable based on user id" do
      user = double("User", id: 123)
      session[:user_id] = user.id
      # mocking the @current user in the sessions helper
      @current_user = user
      expect(current_user).to eq(user)
    end
  end

  describe "#current_user" do
  it "it creates a current user from the database" do
    user = double("User", id: 123)
    session[:user_id] = user.id
    user_class = class_double("User").
    as_stubbed_const(:transfer_nested_constants => true)
    allow(user_class).to receive(:find_by).with(id: session[:user_id]).and_return(user)
    expect(current_user).to eq(user)
  end
end
end
