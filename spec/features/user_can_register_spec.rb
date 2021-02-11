require 'rails_helper'

RSpec.feature "Register account", type: :feature do
  scenario "user can sign up" do
    visit "/"
    within_fieldset :sign_up do
      fill_in "user_username", with: "Lotty"
      fill_in "user_password", with: "Password12"
      fill_in "user_full_name", with: "Charlotte Cole"
      fill_in "user_email", with: "charlotte@gmail.com"
      fill_in "user_mobile", with: "07474289731"
      fill_in "user_address", with: "London, UK"
      
      click_button "Sign Up"
    end
    expect(page).to have_content("You have signed up")
  end
end

RSpec.feature "Invalid sign up", type: :feature do
  scenario "no username" do
    visit "/"
    within_fieldset :sign_up do
      fill_in "user_password", with: "Password12"
      click_button "Sign Up"
    end
    expect(page).to have_content("Validation failed: Username can't be blank")
  end

  scenario "no password" do
    visit "/"
    within_fieldset :sign_up do
      fill_in "user_username", with: "Lotty"
      click_button "Sign Up"
    end
    expect(page).to have_content("Validation failed: Password can't be blank")
  end

  scenario "repeated username" do
    visit "/"
    within_fieldset :sign_up do
      fill_in "user_username", with: "Charlotte"
      fill_in "user_password", with: "Password12"
      click_button "Sign Up"
    end
    expect(page).to have_content("Validation failed: Username has already been taken")
  end

end