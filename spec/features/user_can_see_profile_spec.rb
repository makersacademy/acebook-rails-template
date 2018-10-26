require 'rails_helper'

RSpec.feature 'Profile page', type: :feature do
  before(:each) do
    sign_up_correct_helper
    create_post("Hello!")
  end

  scenario 'user visits profile page and sees name' do
    visit '/profile'
    expect(find('#user-name-title')).to have_content('TestName')
  end

  scenario 'user visits profile and sees their own posts' do
    visit '/profile'
    expect(find('#1.post-message')).to have_content "Hello!"
  end

  scenario "user visits another profile and can see only that user's posts" do
    click_on('Logout')
    sign_up_helper("bob@bob.com", "Bob", "bobbob")
    create_post("Goodbye")
    visit '/users/1'
    expect(page).not_to have_content "Goodbye"
    expect(page).to have_content "Hello"
  end
end
