require 'rails_helper'

feature 'User can logout', type: :feature do
  scenario 'a user can logout' do
    user = User.create(fname: 'Jon', lname: 'Doe', email: 'john.doe@example.com', password: 'password')
    visit '/sessions/new'

    fill_in 'user[email]', with: 'john.doe@example.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Sign in'

    expect(current_path).to eq "/posts"
    expect(page).to have_content "Welcome #{user.fname} #{user.lname}"

    click_link 'Sign Out'
    expect(current_path).to eq "/"
  end
end
