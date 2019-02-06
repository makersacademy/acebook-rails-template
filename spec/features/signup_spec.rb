require 'rails_helper'

RSpec.feature 'Sign up' do

  let(:email){'bea_courage@hotmail.co.uk'}
  let(:username){'Makers'}
  let(:password){'testingsucks'}

  context 'Sign up' do

    scenario 'A user can sign up' do
      sign_up(email, username, password)
      expect(page.current_path).to eql('/posts')
      expect(page).to have_content('Welcome! You have signed up successfully.')

    end
  end


end
