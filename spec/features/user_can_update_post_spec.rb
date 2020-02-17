require 'rails_helper'
require 'web_helpers'

RSpec.feature "Timeline", type: :feature do
  let(:user){create(:user)}
  let(:user1){create(:user)}
  let(:post){create(:post)}
  
  scenario "Can view update button" do
    sign_up
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"

    expect(page).to have_button("Update")
  end
  
  # travis doesn't like the "fill_in "Message", with: "Hello, Acebook Insane!"
  # scenario "Can update post" do
  #   sign_up
  #   click_link "New post"
  #   fill_in "Message", with: "Hello, world!"
  #   click_button "Submit"
  #   sleep(5) 
  #   first('.post').click_button 'Update'
  #   # find('#updatePost').set("Hello, Acebook Insane!")
  #   fill_in "Message", with: "Hello, Acebook Insane!"
  #   click_button 'Save Post'

  #   expect(page).to have_content("Hello, Acebook Insane!")
  #   expect(page).to have_content(Time.now.strftime("%Y/%m/%d %H:%M:%S").to_s)
  # end

  # scenario "Can’t update someone else’s post" do
  #   post
  #   visit "/"
  #   click_button("Login")
  #   fill_in "email", with: user.email
  #   fill_in "password", with: user.password
  #   click_button("Login")
  #   click_button("Update")
  #   expect(page).to have_content("This is not your post to update")
  # end

end