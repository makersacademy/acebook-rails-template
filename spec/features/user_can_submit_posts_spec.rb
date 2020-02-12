require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit('/')
    click_link('Sign Up')
    fill_in 'user[email]', with: 'userone@gmail.com'
    fill_in 'user[password]', with: 'secret'
    click_button 'Save User'
    fill_in "post[message]", with: "Hello, world!"
    click_button "Create Post"
    expect(page).to have_content("Hello, world!")
  end
end
