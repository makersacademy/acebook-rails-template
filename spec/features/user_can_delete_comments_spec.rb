# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Comment', type: :feature do
  scenario 'User can delete their own comment' do
    sign_up
    new_post
    comment_on_post
    click_link 'Delete Comment'
    expect(page).to_not have_content('First Comment')
  end

end
