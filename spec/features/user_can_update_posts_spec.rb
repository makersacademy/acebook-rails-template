# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  scenario 'user can update posts' do
    sign_up(email: 'test@test.com', password: 'password')
    add_post(message: 'Post number one')

    first(:button, 'Edit').click

    post = Post.all[0]

    expect(current_path).to eq "/posts/#{post.id}/edit"
    expect(page).to have_content('Post number one')

    updated_time = post.updated_at.strftime('%Y-%m-%d, %H:%M')

    fill_in 'Message', with: 'This is an edited message!'
    click_button 'Update'

    expect(page).to have_content('This is an edited message!')
    expect(page).not_to have_content('Post number one')
    expect(page).to have_content(updated_time)
  end
end
