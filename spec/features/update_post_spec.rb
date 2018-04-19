require 'rails_helper'

RSpec.feature 'update posts' do
  scenario 'user can update own posts' do
    sign_up
    new_post
    click_on 'Edit'
    fill_in 'post_message', with:('blah blah hello')
    click_button 'Update Post'
    expect(page).to have_content 'blah blah hello'
  end
end
