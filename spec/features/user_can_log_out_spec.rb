require_relative '../helpers/features_helper.rb'

RSpec.feature "Timeline", type: :feature do

  scenario "Can log out" do
    sign_up
    sign_in
    click_link("Logout")
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end
end

