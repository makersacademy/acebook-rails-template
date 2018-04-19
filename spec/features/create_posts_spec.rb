require 'rails_helper'

RSpec.feature 'create new post' do
  scenario 'user can create a new post' do
    sign_up
    click_on 'New Post'
    fill_in 'Message', with: 'blah blah'
    click_on 'Create Post'
    expect(page).to have_content('blah blah')
  end
end
