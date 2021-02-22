RSpec.feature "Available posts", type: :feature do
  scenario "Can view all posts" do
    log_in
    visit "/courses/1/posts"
    expect(page).to have_content("Lesson 1 - Test Post")
  end

  # scenario "Can add a post" do
  #   log_in
  #   visit "/courses/1"
  #   click_on "Add Post"
  #   fill_in "post_title", with: "If Statements"
  #   fill_in_trix_editor "post_content", with: "if (condition), elsif(other condition), else, end"
  #   click_on "Submit"
  #   expect(page).to have_content("Lesson 2 - If Statements")
  # end

  scenario "Cannot add a post if don't own course" do
    sign_up_and_in_new_user
    visit "/courses/1"
    expect(page).not_to have_selector(:link_or_button, 'Add Post')
  end
end
