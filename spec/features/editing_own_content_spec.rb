# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'users can only delete own comment', type: :feature do
  scenario 'user signs in, posts, signs out, another user cant delete post', :js => true  do
    sign_up
    add_new_post
    sign_out
    sign_up_second_user
    expect(page).to have_content 'Hello, world!'
    expect(page).not_to have_selector "input[type=submit][value='Delete']"
  end
end
