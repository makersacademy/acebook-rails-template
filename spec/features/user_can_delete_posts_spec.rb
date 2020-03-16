require 'rails_helper'
RSpec.feature "Delete Posts", type: :feature do 

  scenario "Logged in users can delete their posts" do 
    sign_up("test@example.com", "123456")
    create_post("test message")
    click_button("Delete")
    expect(page).not_to have_content("test message") 

  end 

  scenario "Other users can deletes other users posts" do 
    User.create(id: 1, name: 'Test Name', email: 'signin_test@example.com', password: '123456')
    Post.create(message: "Can't delete test", user_id: 1)
    sign_up("test@example.com", "123456")
    click_button("Delete")
    expect(page).to have_content("Error: can't delete posts by other users")
  end

end
