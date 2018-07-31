require 'rails_helper'

RSpec.feature "SignUp", type: :feature do

    scenario "A user can sign up with valid credentials" do
      successful_sign_up
      expect(page).to have_content("Welcome Elishka!")
    end

end
