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

    expect(page).to have_content('Successfully commented!')
  end


end
