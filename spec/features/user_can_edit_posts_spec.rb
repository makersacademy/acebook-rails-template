# frozen_string_literal: true

require 'rails_helper'

describe 'can edit a post' do
  it 'create new post then immediately edit it' do
    new_post
    click_link 'Edit'
    fill_in 'post[message]', with: 'Goodbye cruel world!'
    click_button 'Update'
    # check text on index page
    expect(page).to have_content('Goodbye cruel world!')
  end
end
