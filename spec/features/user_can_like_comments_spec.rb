require 'rails_helper'

RSpec.feature 'User can like a comment', type: :feature do
  scenario 'A registered user can like a comment' do
    make_comment
    click_link('Like')
    expect(page).to have_content('1 👍')
  end

  scenario 'An unregistered user cannot like a post' do
    make_comment
    click_link('Sign Out')
    click_link('Timeline')
    expect(page).not_to have_link('Like')
  end
end
