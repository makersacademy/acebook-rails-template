require 'rails_helper'

feature 'Signing Out' do
  before do
    @user = User.create(:email => 'testenv@example.com', :password => 'testpass')
  end
  it 'Signs out successfully' do
    visit "/users/sign_in"
    fill_in "Email", with: "testenv@example.com"
    fill_in "Password", with: "testpass"
    click_button "Log in"
    click_button 'Log out'
    expect(page).to have_selector(:link_or_button, 'Log in')
    expect(current_path).to eq('/')
    expect(page).to have_no_content("Welcome! You have signed up successfully.")
  end
end
