require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can delete posts' do
    sign_up_as_new_user
    add_post
    click_link 'Delete'
    expect(current_path).to eq('/posts')
    expect(page).not_to have_content('Hello, world!')
  end
end


def add_post
  sign_up_as_new_user
  visit '/posts'
  click_link 'New post'
  fill_in 'Message', with: 'Hello, world!'
  click_button 'Submit'
  expect(page).to have_content('Hello, world!')
end
