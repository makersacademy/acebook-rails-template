# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User', type: :feature do
  scenario 'Un-signed up user always redirected to the log in page' do
    visit '/'
    visit '/posts'
    expect(current_path).to eql('/users/sign_in')
  end

  scenario 'Redirected to user\'s wall after sign up' do
    visit '/'
    sign_up
    expect(current_path).to eql(user_page_path(User.all.first.id))
  end

  scenario 'Redirected to user\'s wall after log in' do
    visit '/'
    log_in
    expect(current_path).to eql(user_page_path(User.all.first.id))
  end

  scenario 'User cannon access another users wall if not logged in' do
    sign_up
    @user_id = User.all.first.id
    click_link 'Logout'
    visit user_page_path(@user_id)
    expect(current_path).to eql('/users/sign_in')
  end
  
end
