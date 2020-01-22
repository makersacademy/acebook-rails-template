require 'rails_helper'

RSpec.feature "Delete", type: :feature do
  before(:each) do
    sign_up('Harry', 'Mumford', 'harry_mumford@hotmail.co.uk', 'password')
  end

  scenario "Can update a comment" do
    new_post('First post')
    new_comment('Test comment')
    expect(page).to have_content("Test comment")
    within('.comment') do
      click_link "Delete"
    end

    expect(page).to_not have_content("Test comment")
  end

  scenario "User receives an error message when they try to update another users comment" do
    new_post('First post')
    new_comment('Test comment')

    click_on 'Sign out'

    sign_up('Andrea', 'Diotallevi', 'andrea@example.co.uk', 'password')

    within('.comment') do
      click_link "Delete"
    end

    expect(page).to have_content('You can only delete your own comments')
    expect(page).to have_content('Test comment')
    expect(page.current_path).to eq('/posts')
  end
end
