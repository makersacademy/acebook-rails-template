require 'rails_helper'
require 'web_helpers'

RSpec.feature 'Sign out', type: :feature do
  scenario 'Can sign out' do
    sign_up
    click_on "Sign out"
    expect(current_path).to eq "/users/sign_in"
  end

  scenario 'Can sign out and then sign in' do
    sign_up
    click_on "Sign out"
    sign_in
    expect(current_path).to eq "/posts"
  end
end
