require 'rails_helper'

RSpec.feature 'Delete posts', type: :feature do
  scenario 'A user can delete their posts' do
    visit '/sign_up'
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: 'password'
    click_button 'Sign up'
    click_on 'new_post'
    fill_in 'post_message', with: 'My new post'
    click_on 'Submit'
    click_button 'delete'

     expect(page).not_to have_content('My new post')
  end


  # scenario 'A user cannot delete other peoples posts' do
  #   visit '/sign_up'
  #   fill_in 'user_email', with: 'test@test.com'
  #   fill_in 'user_password', with: 'password'
  #   click_button 'Sign up'
  #   click_on 'new_post'
  #   fill_in 'post_message', with: 'My new post'
  #   click_on 'Submit'
  #   click_button 'sign_out'
  #
  #
  #
  #
  #
  #
  #   click_button 'delete'
  #
  #    expect(page).not_to have_content('My new post')
  # end
end
