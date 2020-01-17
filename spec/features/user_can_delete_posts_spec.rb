require 'rails_helper'

RSpec.feature "Update", type: :feature do
  scenario "Can update specific posts" do

    sign_up('Harry', 'Mumford', 'harry_mumford@hotmail.co.uk', 'password')
    
    new_post('First post')
    new_post('Second post')
 
    within(first(".post")) do
      click_link "Delete"
    end
    
    expect(page).to have_content("First post")
    expect(page).not_to have_content("Second post")
  end
end
