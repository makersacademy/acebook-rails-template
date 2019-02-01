require 'rails_helper'

RSpec.feature 'User Authenication' do

  let(:email){'bea_courage@hotmail.co.uk'}
  let(:password){'testingisfunlol'}

  context 'Log in' do

    scenario 'A user can log in' do
      sign_up(email, password)
      click_on 'Logout'
      log_in(email, password)
      expect(page.current_path).to eql('/posts')
      # expect(page).to have_content('Welcome to Acebook and Chill')
    end



  end



end
