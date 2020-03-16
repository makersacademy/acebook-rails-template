require 'rails_helper'

RSpec.feature "Post Managment", type: :feature do
  scenario "Can update posts" do
    sign_up('test@example.com', 'password')
    create_post('Hello, world!')
    first(".post").click_on "Update"
    fill_in "Message", with: "This is a different message"
    click_button "Submit"
    expect(page).to have_content "This is a different message"
    expect(page).not_to have_content "Hello, world!"
  end

  scenario "Cannot update other users posts" do 
    User.create(id: 1, name: 'Test Name', email: 'signin_test@example.com', password: '123456')
    Post.create(message: "Can't update test", user_id: 1)
    sign_up("test@example.com", "123456")
    first(".post").click_on "Update"
    expect(page).to have_content("Error: can't update posts by other users")
  end

  scenario "Cannot update posts after 10 minutes" do
    sign_up('test@example.com', 'password')
    create_post('Hello, world!')
    Timecop.travel(Time.current + 660)
    first(".post").click_on "Update"
    expect(page).to have_content("Error: can't update posts after 10 minutes")
  end

end
