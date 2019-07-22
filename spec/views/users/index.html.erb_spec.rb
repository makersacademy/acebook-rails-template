require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :email => "test1@test1.com",
        :password => "testopen"
      ),
      User.create!(
        :email => "test2@test2.com",
        :password => "testopen"
      )
    ])
  end
end
