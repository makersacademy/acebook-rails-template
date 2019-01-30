# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do

  describe "#validate" do
    it "doesn't let you save a user without an email" do
      cont = UsersController.new
      user = User.new({:username => 'test0001',:email => "",:password => "12345"})
      expect(user.save).to eq false
    end
  end
end
