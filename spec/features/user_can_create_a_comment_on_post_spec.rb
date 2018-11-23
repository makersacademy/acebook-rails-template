# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Creating comments', type: :feature do
  before do
    login(email: 'test@user.com', password: 'qwerty')
    post_message(message: 'Hello, world!')
  end

  scenario 'User can comment on their own post' do
    click_link('Hello, world!')
    click_button 'Comment'
    fill_in('Body', with: 'this is a comment' )
    click_button 'Submit'
    expect(page).to have_content('this is a comment')
    expect(page).to have_content('Successfully commented!')
  end

end
