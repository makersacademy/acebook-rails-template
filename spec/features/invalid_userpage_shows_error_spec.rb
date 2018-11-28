require 'rails_helper'
require_relative '../web_helpers.rb'

RSpec.feature 'Invalid User Error', type: :feature do
  scenario 'signed in user see an error page if user wall does not exist' do
    visit_site_sign_up
    visit '/1234'
    expect(page).to have_content 'This user doesn’t exist'
  end
end
