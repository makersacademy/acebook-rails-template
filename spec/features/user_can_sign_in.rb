require 'rails_helper'

feature 'test sign in' do
  scenario 'Sign up / logout and then sign in' do
    # First Sign Up so ther user exists in the system

    sign_in

    # First Sign Up so ther user exists in the system
    click_link 'logout'

    # then login

    log_in

    expect(page).to have_content('Hello')
  end
end
