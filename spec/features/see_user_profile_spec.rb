RSpec.feature "User profile", type: :feature do
  scenario "Can view a user's profile" do
    visit "/users/1"
    expect(page).to have_content("testuser1")
    expect(page).to have_content("Intro to Ruby")
  end
end