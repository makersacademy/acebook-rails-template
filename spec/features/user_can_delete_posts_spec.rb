RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and edit them" do
    visit "/posts"
    click_link "New post"
    fill_in "post[message]", with: "This is a test post!"
    click_button "Create Post"
    visit "/posts"
    click_link "Destroy"
    expect(page).not_to have_content("This is a test post!")
  end
end
