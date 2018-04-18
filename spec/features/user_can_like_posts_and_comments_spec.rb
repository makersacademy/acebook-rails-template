# frozen_string_literal: true

require 'rails_helper'
require_relative '../helpers/custom_helper'

RSpec.describe 'Timeline', type: :feature do
  scenario 'User wants to like a post' do
    sign_up
    create_post
    find(:xpath, "//a/img[@alt='Darts png57']/..").click
    expect(page).to have_content('1')
  end
end

RSpec.describe 'Timeline', type: :feature do
  scenario 'User wants to like a comment' do
    sign_up
    create_comment
    find(:xpath, "//a/img[@alt='comment_like']/..").click
    expect(page).to have_content('1')
  end
end
