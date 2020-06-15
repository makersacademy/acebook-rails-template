require 'rails_helper'
require_relative '../web_helpers.rb'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can sign up' do
    visit_site_sign_up
    visit '/'
    expect(page).to have_content("Welcome username123") # username123 is the username used to sign up ^
  end
end
