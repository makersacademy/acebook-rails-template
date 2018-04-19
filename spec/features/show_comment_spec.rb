require 'rails_helper'

RSpec.feature 'show comment' do
  scenario 'user can see comment content' do
    sign_up
    new_post
    new_comment
    click_on 'Show'
    expect(page).to have_content('text')
  end
end
