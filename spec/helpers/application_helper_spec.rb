# frozen_string_literal: true

require "rails_helper"

RSpec.describe ApplicationHelper do
  describe "#log_in" do
    it "creates a session id" do
      user = double("User", id: 123)
      log_in(user)
      expect(session[:user_id]).to eq(123)
    end
  end
end
