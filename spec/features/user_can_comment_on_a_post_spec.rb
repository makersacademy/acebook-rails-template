# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Commenting on posts', type: :feature do
  before(:each) do
    sign_up
    add_new_post
    add_comment
  end

  scenario 'users can submit comments on posts' do
    expect(page).to have_content('Charlene')
    expect(page).to have_content('Rails is awesome')
  end

  scenario 'users can like comments' do
    click_link('like_comment')
    expect(page).to have_content 'Comment Like 1'
  end

  scenario 'users can unlike a comment they already liked' do
    click_link('like_comment')
    expect(page).to have_content 'Comment Like 0'
  end
end
