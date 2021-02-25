# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    visit '/users/sign_up'
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'testpass'
    fill_in 'Password confirmation', with: 'testpass'
    click_button 'Sign up'
    create_a_new_post_and_see_it_on_the_feed("Hello, world!")
  end

  scenario 'Posts are shown in order of creation' do
    visit '/users/sign_up'
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'testpass'
    fill_in 'Password confirmation', with: 'testpass'
    click_button 'Sign up'
    create_a_new_post_and_see_it_on_the_feed("Hello, world!")
    create_a_new_post_and_see_it_on_the_feed("I am first")
    expect(page.all('p')[0]).to have_content 'I am first'
  end
end
