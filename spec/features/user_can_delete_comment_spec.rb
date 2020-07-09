RSpec.feature "Timeline", type: :feature do
  before(:each) do
    visit "/"
    click_link "Sign Up"
    fill_in "user_firstname", with: "Bene"
    fill_in "user_lastname", with: "Arinci"
    fill_in "user_email", with: "test@gmail.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Create User"
    fill_in "email", with: "test@gmail.com"
    fill_in "password", with: "123456"
    click_button "Login"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    fill_in "comment_body", with: "new comment"
    click_button "Comment"
  end

  scenario "comments have a delete link" do
    within("#singlecomment") { expect(page).to have_link("Delete") }
  end 

  scenario "users can delete their own comments" do 
    within("#singlecomment") {click_link("Delete")}
    expect(page).not_to have_content("new comment")
  end 

  scenario "user receives a confirmation message after deleting a post" do
    within("#singlecomment") {click_link("Delete")}
    expect(page).to have_content("comment successfully deleted")
  end

  scenario "user cannot delete other user's comments" do
    click_link("Log out")
    click_link "Sign Up"
    fill_in "user_firstname", with: "Anthony"
    fill_in "user_lastname", with: "D"
    fill_in "user_email", with: "ad@gmail.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Create User"
    fill_in "email", with: "ad@gmail.com"
    fill_in "password", with: "123456"
    click_button "Login"
    within("#singlecomment") { expect(page).not_to have_link("Delete") }
  end 
end