# frozen_string_literal: true

require 'rails_helper'
require 'selenium-webdriver'

RSpec.feature 'Timeline', type: :feature do
  before(:each) do
    @user = User.new(name: "Lizardo", email: "lizard@example.com", password: "123secure", password_confirmation: "123secure")
    @user.save
    sign_in_helper(@user)
  end

  scenario 'Can submit posts and view them' do
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')
  end
end
