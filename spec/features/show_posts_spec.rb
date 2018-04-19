require 'rails_helper'

RSpec.feature 'show post' do
  scenario 'user can see post content' do
    sign_up
    new_post
    expect(page).to have_content('blah blah')
  end
end
