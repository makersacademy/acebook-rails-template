require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  def helper
    10.times do
      puts ""
    end
  end

  describe ".create" do
    it "creates a user and saves them in database" do
      params = {"firstname"=>"Kay", "lastname"=>"Mo", "email"=>"k@mos.com", "password"=>"password"}
      user = User.create(params)
      p "USER #{user}"
      id = user.id
      p "ID #{id}"
      test_user = User.find_by(id: id)
      expect(user).to eq test_user
    end
  end

  describe '.destroy' do
    it "deletes a user from the database" do
      params = {"firstname"=>"Kay", "lastname"=>"Mo", "email"=>"k@mos.com", "password"=>"password"}
      user = User.create(params)
      id = user.id
      p "ID #{id}"
      p "passong test"
      user.destroy
      test = User.find_by(id: id)
      expect(test).to eq nil
    end
  end
end
