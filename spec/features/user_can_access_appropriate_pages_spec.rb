require 'rails_helper'

describe 'user can access different pages when logged in or not logged in' do
  it 'user who is not logged in tries to view a wall, and is redirected to log in' do
    visit '/posts'
    expect(page).to have_current_path '/'
    expect(page).to have_button('Log in')
  end
end
