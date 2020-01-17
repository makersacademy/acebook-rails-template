RSpec.feature "Timeline", type: :feature do
  scenario "User can delete their own posts" do
    sign_up
    new_post
    click_on "Delete"
    expect(page).to_not have_content("Hello, world!")
  end
end
