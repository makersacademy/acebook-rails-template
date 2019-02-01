require 'rails_helper'

RSpec.feature 'Sign up' do

  let(:email){'bea_courage@hotmail.co.uk'}
  let(:password){'testingsucks'}

  context 'Sign up' do

    scenario 'A user can sign up' do
      visit '/'
      click_on 'Signup'
      fill_in "user_email", with: email
      fill_in "user_password", with: password
      fill_in "user_password_confirmation", with: password
      click_button 'Sign up'
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end
  end



end
