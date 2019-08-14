require 'rails_helper'

RSpec.feature "View profile", type: :feature do
  scenario "Once signed up can view profile" do
    sign_up
    expect(page).to have_content("Zizi")
    expect(page).to have_content("Dweng")
    expect(page).to have_content("zizidwengy@email.com")  
    expect(page).to have_content("Password")
  end
end
