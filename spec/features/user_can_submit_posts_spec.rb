require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    # TODO: add login helper method
    sign_in
    visit '/posts'
    click_button '+'
    fill_in 'post[message]', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')
  end
end
