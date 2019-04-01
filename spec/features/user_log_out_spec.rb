require 'rails_helper'
require 'simple_send_keys'

RSpec.feature "log out", type: :feature, js: true do
  scenario "User directed to sign in page on log out" do
    user_sign_up
    click_button('Logout')
    expect(page.current_path).to eq '/users/sign_in'
  end

  scenario "User restricted to login page after log out" do
    user_sign_up
    click_button('Logout')
    visit('/posts/new')
    expect(page.current_path).to eq '/users/sign_in'
  end
end
