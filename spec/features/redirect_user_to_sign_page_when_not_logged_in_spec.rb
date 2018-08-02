require 'rails_helper'

RSpec.feature "User's index page", type: :feature do

  context "User not signed in" do
    scenario "Redirect user to sign-in page" do
      visit("/users/1")
      expect(page.current_path).to eq("/")
    end
  end

end
