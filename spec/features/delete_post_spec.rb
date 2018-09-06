require 'rails_helper'

RSpec.feature 'Delete a post', type: :feature do
  scenario 'User can delete a post they created' do
    sign_up
    create_post
    click_link('Delete')
    expect(page).not_to have_content('Hello, world!')
  end
end
