require 'rails_helper'
require 'web_helpers'

RSpec.feature "Timeline", type: :feature do
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
end