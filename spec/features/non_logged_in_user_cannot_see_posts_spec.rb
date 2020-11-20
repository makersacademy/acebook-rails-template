require 'rails_helper' 

RSpec.feature "Non-logged in user", type: :feature do
  scenario "cannot see posts" do
    user_signup('arakno', 'arakno@makers.com', 'Arabella Knowles', 'makers4L')
    create_post('Hello World!')
    click_link "Logout"
    expect(page).not_to have_content("Hello World!")
  end

  scenario "cannot see new post link" do
    user_signup('arakno', 'arakno@makers.com', 'Arabella Knowles', 'makers4L')
    click_link "Logout"
    expect(page).not_to have_link('New post')
  end
end
