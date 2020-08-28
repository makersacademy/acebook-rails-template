require 'rails_helper'

RSpec.feature 'posting posts', type: :feature do
  scenario 'Can submit posts and view them' do
    sign_up
    click_link 'See Posts'
    click_link 'New post'
    fill_in 'post[message]', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')
  end
end
