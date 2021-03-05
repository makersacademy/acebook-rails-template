# frozen_string_literal: true

module Helpers
  module HelpingHand
    def register
      visit '/'
      click_link 'Register'
      fill_in 'Name', with: 'Katy Day'
      fill_in 'Username', with: 'Katy_the_Magnificent'
      fill_in 'Email', with: 'email@example.com'
      fill_in 'Password', with: 'password123'
      fill_in 'Password confirmation', with: 'password123'
      click_button 'Sign up'
    end

    def register_second_user
      visit '/'
      click_link 'Register'
      fill_in 'Name', with: 'John Smith'
      fill_in 'Username', with: 'IPA'
      fill_in 'Email', with: 'email@email.com'
      fill_in 'Password', with: 'password123'
      fill_in 'Password confirmation', with: 'password123'
      click_button 'Sign up'
    end

    def submit_post
      visit '/posts'
      click_link 'New post'
      fill_in 'Message', with: 'Hello, world!'
      click_button 'Submit'
    end

    def friend_request
      register
      submit_post
      click_link 'Sign out'
      register_second_user
      click_link 'Katy Day'
      click_link 'Be my friend'
      click_link 'Sign out'
      click_link 'Sign in'
      fill_in 'Email', with: 'email@example.com'
      fill_in 'Password', with: 'password123'
      click_button 'Sign in'
      click_link 'Profile'
      click_link 'Friend Requests'
    end
  end
end
