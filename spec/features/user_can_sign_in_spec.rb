# frozen_string_literal: true

require 'rails_helper'

describe 'test sign in' do
  it 'Sign up / logout and then sign in' do
    # First Sign Up so ther user exists in the system

    sign_up

    # First Sign Up so ther user exists in the system
    click_link 'logout'

    # then login

    log_in

    expect(page).to have_content('logout')
  end
end
