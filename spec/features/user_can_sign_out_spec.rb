require 'rails_helper'

RSpec.feature 'Sign-Out', type: :feature do
  scenario 'Can sign out of the BBB Acebook' do
    register
    expect(page).to have_current_path('/')
    expect(page).to have_content('Hello, Katy')
    click_link('Sign out')
    expect(page).to have_current_path('/')
    expect(page).to have_content('Hello, Stranger')
  end
end
