require 'rails_helper'

RSpec.feature "Display username", type: :feature do
  scenario "User can see their username" do
    sign_up_and_sign_in
    click_link "Profile"
    expect(page).to have_content('Clint GoldFish Pondsworth')
  end

  scenario "User can click on antoher user's name to see their profile" do
    sign_up_and_sign_in
    click_link "Log Out"
    sign_up_and_sign_in_2
    click_link "Users"
    click_link "Clint Pondsworth"
    expect(page).to have_content('GoldFish')
  end

  scenario "user's own post history is displayed on profile" do
    sign_up_and_sign_in
    fill_in 'Message', with: 'Dis ma post history'
    click_button 'Submit'
    click_link 'Profile'
    expect(page).to have_content('Dis ma post history')
  end

  scenario "Another user's post history is displayed on their profile" do
    sign_up_and_sign_in
    fill_in 'Message', with: 'Dis ma post history'
    click_button 'Submit'
    click_link 'Log Out'
    sign_up_and_sign_in_2
    click_link 'Users'
    click_link 'Clint Pondsworth'
    expect(page).to have_content('Dis ma post history')
  end

  scenario "user's own post history is displayed on profile in chronological order" do
    sign_up_and_sign_in
    fill_in 'Message', with: 'Dis ma post history'
    click_button 'Submit'
    fill_in 'Message', with: 'Dis da rest of ma post history'
    click_button 'Submit'
    click_link 'Profile'
    expect('Dis da rest of ma post history').to appear_before('Dis ma post history')
  end
end
