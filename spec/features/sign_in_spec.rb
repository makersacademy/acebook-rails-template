# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Signing in', type: :feature do
  scenario 'successful sign in' do
    login(email: 'test@user.com', password: 'qwerty')

    expect(page).to have_content 'Signed in successfully.'
    expect(current_path).to eq '/users/1/posts'
  end

  scenario 'incorrect email' do
    login(email: 'test@uer.com', password: 'qwerty')

    expect(page).to have_content 'Invalid Email or password'
  end

  scenario 'incorrect password' do
    login(email: 'test@user.com', password: 'qwrty')

    expect(page).to have_content 'Invalid Email or password'
  end
end
