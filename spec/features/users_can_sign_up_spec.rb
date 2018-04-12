# frozen_string_literal: true

require 'rails_helper'
require_relative 'web_helper.rb'

RSpec.feature 'users can sign up', type: :feature do
  scenario 'user can register to Acebook' do
    sign_up
    expect(page).to_not have_content 'Register'
  end
end
