require 'rails_helper'

RSpec.feature 'sign up', type: :feature do
  scenario 'user cans sign up to acebook' do
    visit '/sign_up'
    fill_in "user_firstname", with: "Toast"
    fill_in "user_surname", with: "Thorn"
    fill_in "user_birthday", with: "10/02/1991"
    fill_in "user_gender", with: "Male"
    fill_in "user_email", with: "Toast@example.com"
    fill_in "user_password", with: "123"
  end
end
