# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view' do
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content(Post.all[0].created_at.strftime('Posted at %a %I:%M%p').to_s)
  end
end
