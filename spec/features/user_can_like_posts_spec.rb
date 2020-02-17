require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can like a post' do
    sign_up
    new_post
    click_button 'Like'
    expect(page).to have_content('1 like')
  end

end
