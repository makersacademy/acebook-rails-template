require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can log in" do
    @user = User.create(name: "stephan", dob: '2020-04-04', cob: 'south africa', mob: 112, email: 'stephan@test.com', password: "password")
    # TO DO finish creating user in line above, then try to make this test pass.
    visit "/"
    fill_in "email", with: "stephan@test.com"
    fill_in "password", with: "password"
    click_button "Sign In"
    expect(page).to have_content("Hello stephan")
  end
end
