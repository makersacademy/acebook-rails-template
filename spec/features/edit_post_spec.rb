require 'rails_helper'

RSpec.feature 'Edit a post', type: :feature do
  scenario 'User can edit a post they created' do
    sign_up
    sign_in
    create_post
    click_link('Edit')
    fill_in 'post[message]', with: 'Hello, kirt!'
    click_button("Update Post")
    expect(page).to have_content('Hello, kirt!')
  end
end
