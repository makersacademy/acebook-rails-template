require 'rails_helper'

RSpec.feature 'Edit Post', type: :feature do
  scenario 'displays custom 404 page if user not found' do
    sign_up_user
    sign_in_user
    visit '/users/999'
    expect(page).to have_content('404 Alien Not Found')
  end
end
