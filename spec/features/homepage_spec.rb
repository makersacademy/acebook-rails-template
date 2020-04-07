require 'rails_helper'

RSpec.feature 'Homepage', type: :feature do
  scenario 'Can view the homepage' do
    visit '/'
    expect(page).to have_content('Welcome to Acebook')
  end
end
