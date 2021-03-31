require 'rails_helper'

feature 'editing posts' do
    before(:each) do
      @user = User.new(name: "Lizardo", email: "lizard@example.com", password: "123secure", password_confirmation: "123secure")
      @user.save
      sign_in_helper(@user)
      click_link "New Post"
      fill_in "post[message]", with: "Hello Lizard"
      click_button "Submit"
    end

    scenario 'user can change content of their posts' do
        first(:button, "Edit Post").click
        fill_in "Message", with: "Goodbye Lizard"
        click_button "Submit"
        expect(page).to have_content("Goodbye Lizard")
        expect(page).not_to have_content("Hello Lizard")
    end
end
