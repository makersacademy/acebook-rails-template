# frozen_string_literal: true

require 'rails_helper'
require_relative '../support/helpers.rb'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    addPost("Hello, world!")
    expect(page).to have_content('Hello, world!')
  end
end
