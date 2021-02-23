RSpec.feature "User profile", type: :feature do
  scenario "Can view a user's profile" do
    log_in
    visit "/users/1"
    expect(page).to have_content("testuser1")
    expect(page).to have_content("Intro to Ruby")
  end

  scenario "Can edit your profile" do
    log_in
    visit "/users/1"
    expect(page).to have_selector(:link_or_button, 'Edit Profile')
    expect(page).to have_selector(:link_or_button, 'Delete Profile')
  end

  # scenario "Cannot edit other people's profile" do
  #   sign_up_and_in_new_user
  #   visit "/users/1"
  #   expect(page).not_to have_selector(:link_or_button, 'Edit Profile')
  # end
end