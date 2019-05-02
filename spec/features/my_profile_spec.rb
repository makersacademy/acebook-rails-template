require 'rails_helper'

RSpec.feature 'My profile', type: :feature do
    scenario 'I want the posts page to have a button to take me to my profile' do
sign_up_helper('user@test.com', '123456')
log_in_helper('user@test.com', '123456')
expect(page).to have_button('Go to my profile')
end 

scenario 'i want the "go to my profile" button to take me to my profile' do
    sign_up_helper('user@test.com', '123456')
    log_in_helper('user@test.com', '123456')
    click_button('Go to my profile')
    expect(page).to have_content('My profile')
end



end 