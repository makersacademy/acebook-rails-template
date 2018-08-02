require 'rails_helper'

RSpec.feature "User's index page", type: :feature do

  before(:each) do
    @user = User.create(first_name: "test_first_name", last_name: "test_last_name", email: "test_email@keepingitrails.com", password: "pa55w0rd")
  end

  describe "A User visits another user's index page" do
    describe "Redirect user to index page" do
      visit("/users/#{@user.id}")
      expect(response).to redirect_to("/")
    end
  end
end
