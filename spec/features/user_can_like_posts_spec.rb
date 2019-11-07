require 'rails_helper'

RSpec.feature "Like post", type: :feature do
  scenario "User can like their post and number of likes will change" do
    create_user
    login_user
    visit '/posts'
    create_post
    click_link "Buzz"
    expect(page).to have_content("Buzzes: 1")
    expect(page).to have_content('⚡️ Buzz')
  end

  scenario "User can like other user's post and number of likes will change" do
    create_user
    login_user
    visit '/posts'
    create_post
    click_link "Buzz"
    logout_user

    create_user_two
    login_user_two
    visit '/posts'
    click_link "Buzz"
    expect(page).to have_content("Buzzes: 2")
  end
  
  scenario "User can unlike the post" do
    create_user
    login_user
    visit '/posts'
    create_post
    click_link "Buzz"
    click_link "Buzz"
    expect(page).to have_content("Buzzes: 0")
  end

end