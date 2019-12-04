require 'rails_helper'

feature 'user sign up' do
  scenario 'user is taken from welcome page to sign up page' do
    visit '/'
    click_link 'Sign up'
    expect(page).to have_text 'Sign up'
  end
end
