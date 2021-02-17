RSpec.feature "Available courses", type: :feature do
  scenario "Can view all posts" do
    log_in
    visit "/courses/1/posts"
    expect(page).to have_content("Lesson 1 - Hello World")
  end

  scenario "Can add a post" do
    log_in
    visit "/courses/1/posts/new"
    fill_in "post_content", with: "If Statements"
    click_on "Submit"
    expect(page).to have_content("Lesson 2 - If Statements")
  end
end
