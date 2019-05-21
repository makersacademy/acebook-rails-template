require 'rails_helper'

RSpec.feature "sign in", type: :feature do
  scenario 'allows user to log into their account' do
    visit '/registration/signin'
    fill_in(:name, with: 'Example Name')
    fill_in(:email, with: 'example@gmail.com')
    fill_in(:password, with: 'examplepassword')
    click_button 'Sign in'
    expect(page).to have_content 'Example Name'
  end
end
