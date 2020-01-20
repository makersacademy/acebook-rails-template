require 'rails_helper'

RSpec.feature "Update", type: :feature do
  before(:each) do
    sign_up('Harry', 'Mumford', 'harry_mumford@hotmail.co.uk', 'password')
  end

  scenario "Can update specific posts" do
    new_post('First post')
    new_post('Second post')
 
    within(first(".post")) do
      click_link "Delete"
    end
    
    expect(page).to have_content("First post")
    expect(page).not_to have_content("Second post")
  end

  scenario "User can only delete their own posts" do
    new_post('First post')
    click_on "Sign out"

    sign_up('Andrea', 'Diotallevi', 'andrea@example.com', 'password')
    within(first(".post")) do
      click_link "Delete"
    end

    expect(page).to have_content("You can only delete your own posts")
    expect(page.current_path).to eq("/posts")
  end
end
