# frozen_string_literal: true

require 'rails_helper'

describe 'Sign Up' do
  describe 'test sign up' do
    it 'Can Sign up and see posts page with logout on it' do
      sign_up
      expect(page).to have_content('logout')
    end
  end

  describe 'test fails sign up' do
    it "user cannot sign up with invalid email address 'Form is invalid' flash notice" do
      visit 'signup'
      fill_in 'Email', with: 'invalidemail'
      fill_in 'Password', with: 'Password'
      click_button 'create'
      expect(page).to have_content('Form is invalid')
    end
  end
end
