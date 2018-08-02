require 'rails_helper'

RSpec.feature "User's index page", type: :feature do

  before(:each) do
    @user = User.create(first_name: "Elishka", last_name: "Flint", email: "elishka@keepingitrails.com", password: "pa55w0rd")
  end

  describe "A User visits another user's index page" do
    describe "Redirect user to index page" do
      visit("/users/#{@user.id}")
      expect(page).to have_content("First name, Last name")
    end
  end
end
