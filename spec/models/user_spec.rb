# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#create_with_omniauth" do
    let(:auth) {
      {
        "provider" => "github",
        "info" => {
          "email" => "jamie.davies@intercom.io",
          "nickname" => "Jamie Davies"
        }
      }
    }

    let(:auth1) {
      {
        "provider" => "github",
        "info" => {
          "email" => "jamie.davies1@intercom.io",
          "nickname" => "Jamie Daviess"
        }
      }
    }

  
    
    it "creates a user" do
      expect {
        User.create_with_omniauth(auth)
      }.to change {
        User.count
      }.by(1)
    end
  
    it "creates a random password" do
      user1 = User.create_with_omniauth(auth)
      user2 = User.create_with_omniauth(auth1)
      expect(user1.password).to_not eql user2.password
    end

    it "sets the rest of the user properties" do
      user1 = User.create_with_omniauth(auth)
      expect(user1.username).to eq auth["info"]["nickname"]
      expect(user1.email).to eq auth["info"]["email"]
    end
  end
end
