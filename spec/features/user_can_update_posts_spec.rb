require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  scenario 'updating posts' do
    sign_up
    click_link 'See Posts'
    click_link 'New post'
    fill_in 'post[message]', with: 'Test'
    click_button 'Submit'
    first(:link, 'Show').click
    first(:link, 'Update').click
    fill_in 'post[message]', with: 'Something else'
    click_button 'Update Post'
    expect(page).not_to have_content('Test')
    expect(page).to have_content('Something else')
  end  
end
