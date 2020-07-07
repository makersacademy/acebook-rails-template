require 'rails_helper'

RSpec.feature "wall", type: :feature do
  scenario "user goes to their wall after sign up" do
    sign_up_with('email@eamil', 'testingName', "password")
    expect(page).to have_content('wall of... testingName')
  end

  scenario "user goes to their wall after sign in" do
    sign_up_with('email@eamil', 'testingName', "password")
    sign_out
    sign_in_with('email@eamil', "password")
    expect(page).to have_content('wall of... testingName')
  end

  scenario "user redirected to sign in" do
    visit "wall/0"
    expect(page).to have_content("sign inc.")
  end

  scenario "only that walls posts displayed" do
    sign_up_with('email@eamil', 'testingName', "password")
    creates_a_post_wall
    expect(page).to have_content("Hello, again")
  end

  scenario "only that walls posts displayed" do
    sign_up_with('email@eamil', 'testingName', "password")
    creates_a_post_wall
    sign_out
    sign_up_with('emai2l@eamil', 'testing2Name', "pass2word")
    expect(page).to_not have_content("Hello, again")
  end
end
