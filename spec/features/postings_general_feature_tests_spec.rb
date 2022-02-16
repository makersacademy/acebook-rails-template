require 'rails_helper'

RSpec.feature "Posting", type: :feature do
  context 'When user has signed up or signed in' do
    context 'When user posts at posts/new' do
      scenario 'it appears on posts/index and user(post-author) profile' do

        sign_up_user
        visit('/')
        click_link 'New Post'
        fill_in 'Message', with: 'The bad boy of coding'
        click_button 'Submit'

        visit('/')
        expect(page).to have_content('The bad boy of coding')

        click_link 'My Profile'
        expect(page).to have_content('The bad boy of coding')
      end
    end 
  

    context 'When user posts at own wall' do
      scenario 'it appears on user(post-author) profile but not on posts/index and' do

        sign_up_user
        fill_in 'Message', with: 'The bad boy of coding'
        click_button 'Submit'

        visit('/')
        expect(page).to_not have_content('The bad boy of coding')

        click_link 'My Profile'
        expect(page).to have_content('The bad boy of coding')
      end
    end

    context 'When user posts at another wall' do

      scenario 'it appears on other receiving user\'s profile but not on posts/index or user(post-author) wall' do
        visit'/'
        click_link 'Sign up'
        fill_in 'Name', with: 'User 1'
        fill_in 'Email', with: 'test@testmail.com'
        fill_in 'Password', with: '123456'
        fill_in 'Password confirmation', with: '123456'
        click_button 'Sign up'
        click_link 'Sign Out'

        user = User.all.first
        

        sign_up_user  
        visit('/')  
        visit "users/#{user.id}"
        fill_in 'Message', with: 'The baddest boy of coding'
        click_button 'Submit'

        visit "users/#{user.id}"
        expect(page).to have_content('The baddest boy of coding')

        visit '/'
        expect(page).to_not have_content('The baddest boy of coding')

        click_link 'My Profile'
        expect(page).to_not have_content('The baddest boy of coding')
      end
    end
  end
end 
  