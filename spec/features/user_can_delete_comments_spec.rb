# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Creating comments', type: :feature do
  before do
    login(email: 'test@user.com', password: 'qwerty')
    post_message(message: 'Hello, world!')
  end

  scenario 'User can delete their own comment on a post' do
    click_link('Hello, world!')
    comment(body: 'this is a comment')
    within('div#comment_3') do
      click_button 'Delete'
    end
    expect(page).to have_content('Comment deleted!')
    expect(page).not_to have_content('this is a comment')
  end


end
