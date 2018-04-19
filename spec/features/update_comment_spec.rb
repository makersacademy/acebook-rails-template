require 'rails_helper'

RSpec.feature 'update comments' do
  scenario 'user can update own comments' do
    sign_up
    new_post
    new_comment
    click_on 'Edit'
    fill_in 'comment_body', with:('new text')
    click_button 'Update Comment'
    expect(page).to have_content 'new text'
  end
end
