# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  before(:each) do
    sign_up
    add_new_post
  end

  scenario 'Can submit posts and view them' do
    expect(page).to have_content('Hello, world!')
  end

  scenario 'Posts show creation timestamp' do
    expect(page).to have_content Time.now.to_s
  end
end

RSpec.feature 'Links', type: :feature do
  scenario 'Redirected to the Posts page when you click on the link' do
    visit '/'
    click_link 'Go to Posts page'
    expect(page).to have_content('News Deck')
  end
end
