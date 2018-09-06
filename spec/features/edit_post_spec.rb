require 'rails_helper'

RSpec.feature 'Edit a post', type: :feature do
  scenario 'User can edit a post they created' do
    sign_up
    create_post
    click_link('Edit')
    fill_in 'post[message]', with: 'Hello, kirt!'
    click_button('Submit')
    expect(page).to have_content('Hello, kirt!')
  end
end
