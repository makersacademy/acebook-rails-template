RSpec.feature "Available posts", type: :feature do
  scenario "Can view all posts" do
    log_in
    visit "/courses/1/posts"
    expect(page).to have_content("Lesson 1 - Test Post")
  end

end
