
require 'rails_helper'


RSpec.feature "User setting", type: :feature do
  scenario "User can change wall colour" do
    signup_as_new_user("Pam")
    login_as_user("Pam")
    save_and_open_page
    select '#9E764D', from: "Background colour"
    click_button "Lizardify me!"
        save_and_open_page
    within('body') do
    page.body.should have_content ('background-color: #9E764D')

    end
  end

  scenario "User can change font" do
    signup_as_new_user("Pam")
    login_as_user("Pam")
    save_and_open_page
    select 'Calibri', from: "Font family"
    click_button "Lizardify me!"
        save_and_open_page
    within('body') do
    page.body.should have_content ('font-family: Calibri')

    end
  end
end
