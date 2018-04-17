require 'rails_helper'

RSpec.describe User, type: :model do

  describe "#username" do
    it "returns email when username is null" do
      user1 = User.create(email: "test1@test.com")
      expect(user1.has_username?).to eq("test1@test.com")
    end

    it "returns username when username is not null" do
      user2 = User.create(email: "test2@test.com", username: "test2")
      expect(user2.has_username?).to eq("test2")
    end
  end
end
