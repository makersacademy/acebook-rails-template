require 'rails_helper'
require_relative '../helpers/users_helper_spec'

RSpec.feature 'Visit own wall', type: :feature do
  scenario 'User redirected to wall after sign_up' do
    sign_up
    expect(page.current_path).to eq('/users/davethecat@katze.com')
  end

  scenario 'User redirected to error page if user not found' do
    sign_up
    visit '/users/Idontexist'
    expect(page.current_path).to eq('/errors')
    expect(page).to have_content('Sorry user not found')
  end

  scenario 'User redirected to wall if enters user_id as param' do
    sign_up
    User.create(first_name: 'Tom', last_name: 'Lawrence', birthday: '2000-01-01', password: 'nerds123', gender: 'Male', email: 'tom@hotmail.com', id: 9_999_999)
    visit "/users/9999999"
    expect(page.current_path).to eq('/users/tom@hotmail.com')
  end

end
