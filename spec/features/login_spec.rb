require 'rails_helper'

RSpec.feature 'User Authenication' do

  let(:email){'bea_courage@hotmail.co.uk'}
  let(:password){'testingisfunlol'}

  context 'Log in' do

    scenario 'A user can log in' do
      visit '/'
      click_on 'Signup'
      p page.body
      fill_in "user_email", with: email
      fill_in "user_password", with: password
      fill_in "user_password_confirmation", with: password
      click_button 'Sign up'
      click_on 'Logout'
      click_on 'Login'
      fill_in "user_email", with: email
      fill_in "user_password", with: password
      click_button 'Log in'
      expect(page).to have_content('Welcome to Acebook and Chill')
    end



  end



end
