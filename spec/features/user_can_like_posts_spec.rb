require 'rails_helper'

RSpec.feature "Like post", type: :feature do
  scenario "User can like their post and number of likes will change" do
    create_user
    login_user
    visit '/posts'
    create_post
    click_link "Like"
    # expect(page).to have_content("Buzzes: 1")
    expect(page).to have_content('⚡️ Like 1')
  end
  
  scenario "User can like other user's post and number of likes will change" do
    create_user
    login_user
    visit '/posts'
    create_post
    click_link "Like"
    logout_user
    
    create_user_two
    login_user_two
    visit '/posts'
    click_link "Like"
    expect(page).to have_content("2")
  end
  
  scenario "User can unlike the post" do
    create_user
    login_user
    visit '/posts'
    create_post
    click_link "Like"
    click_link "Like"
    expect(page).not_to have_content('⚡️ Like 1')
    expect(page).not_to have_content('⚡️ Like 2')
  end
  
end