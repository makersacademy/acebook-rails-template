require 'rails_helper'

RSpec.feature 'Profile page', type: :feature do
  scenario 'user visits profile page and sees name' do
    sign_up_correct_helper
    visit '/profile'
    expect(find('#user-name-title')).to have_content('TestName')
  end
end
