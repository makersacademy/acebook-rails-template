require 'rails_helper'

feature 'User account registration', type: :feature do
  scenario 'a user can register with an account' do
    visit '/'

    expect(page).to have_content 'Create account'

    fill_in 'user[fname]', with: 'John'
    fill_in 'user[lname]', with: 'Doe'
    fill_in 'user[email]', with: 'john@example.com'
    fill_in 'user[password]', with: 'password'
    find('[name=commit]').click

    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content 'Welcome John Doe'
  end
end
