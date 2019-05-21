require 'rails_helper'

RSpec.feature "sign up", type: :feature do
  scenario 'allows user to create account' do
    visit '/registration/signup'
    fill_in(:name, with: 'Example Name')
    fill_in(:email, with: 'example@gmail.com')
    fill_in(:password, with: 'examplepassword')
    click_button 'Sign up'
    expect(page).to have_content 'Example Name'
  end
end
