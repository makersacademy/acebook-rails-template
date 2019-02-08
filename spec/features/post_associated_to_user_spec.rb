# frozen_string_literal: true

require 'rails_helper'
RSpec.feature 'Post Association', type: :feature do
  scenario 'User can only see their posts on their profile' do
    signup_and_click
    post_two_messages

    expect(page.current_path).to eql('/users/1')
    expect(page).to have_content('Message1')
    expect(page).to have_content('Message2')
    expect(page).to have_content(Time.now.strftime('%H:%M:%S - %d/%m/%y'))
  end
end
