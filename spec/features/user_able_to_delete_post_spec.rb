require 'rails_helper'

RSpec.feature 'Delete Post', type: :feature do
  scenario 'User able to delete post' do
    visit '/posts'

    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'

    click_button 'Delete Post'

    expect(page).to_not have_content('Hello, world!')
  end
end