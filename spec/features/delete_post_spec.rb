require 'rails_helper'

RSpec.feature 'delete post' do
  scenario 'user can delete own posts' do
    sign_up
    new_post
    click_on 'Destroy'
    expect(page).to_not have_content('blah blah')
  end
end
