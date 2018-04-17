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
