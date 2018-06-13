require 'rails_helper'

feature 'Sign_in' do
  scenario 'User must sign in before seeing posts' do
    visit('/')
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
