require 'rails_helper'

RSpec.feature "User homepage", type: :feature do

  context "User not signed in" do
    scenario "Redirect user to sign-in page" do
      visit("/users/1")
      expect(page.current_path).to eq("/users/new")
    end
  end

end
