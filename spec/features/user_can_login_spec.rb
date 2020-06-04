require 'rails_helper'

# feature 'User account registration', type: :feature do
#   scenario 'a user can register with an account' do
#     visit '/'

#     expect(page).to have_content 'Create account'

#     fill_in 'user[fname]', with: 'John'
#     fill_in 'user[lname]', with: 'Doe'
#     fill_in 'user[email]', with: 'john@example.com'
#     fill_in 'user[password]', with: 'password'
#     find('[name=commit]').click

#     expect(current_path).to eq '/sessions/new'
#     expect(page).to have_content 'Welcome John Doe'
#   end
# end

feature 'User can login', type: :feature do
  scenario 'a user can login' do
    #signs the user in
    user = User.create(fname: 'Jon', lname: 'Doe', email: 'john.doe@example.com', password: 'password')
    visit '/sessions/new'

    expect(page).to have_content 'Log in'

    fill_in 'user[email]', with: 'john.doe@example.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Sign in'
    
    expect(current_path).to eq "/users/#{user.id}"
    expect(page).to have_content "Welcome #{user.fname} #{user.lname}"
  end
end
