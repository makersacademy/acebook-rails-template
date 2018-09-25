require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end

feature 'User can sign up' do
  scenario 'blank email gives an error' do
    visit 'users/new'
    fill_in 'email', with: ''
    fill_in 'password', with: 'test'
    click_button 'submit'
    expect(page).to have_content('Email can\'t be blank')
  end

  scenario 'blank password gives an error' do
    visit 'users/new'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: ''
    click_button 'submit'
    expect(page).to have_content('Password can\'t be blank')
  end
end
