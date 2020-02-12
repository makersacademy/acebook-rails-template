require 'rails_helper'

RSpec.feature 'Users can visit Signup', type: :feature do
  scenario 'Can visit Signup Page' do
    visit '/'
    click_on 'Signup'
    expect(page).to have_content('Please Signup')
  end
end
