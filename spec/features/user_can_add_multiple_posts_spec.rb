require 'rails_helper'

RSpec.feature 'User can create multiple posts', type: :feature do
  scenario 'User creates a post, then another' do
    sign_up
    sign_in
    create_post
    expect(page).to have_content('Hello, world!')
    click_link('New post')
    fill_in 'post[message]', with: 'Hello, kirt!'
    click_button 'Submit'
    expect(page).to have_content('Hello, kirt!')
  end
end
