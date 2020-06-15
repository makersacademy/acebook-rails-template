# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'
RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    signup_and_post
    expect(page).to have_content('Hello, world!')
  end
end
