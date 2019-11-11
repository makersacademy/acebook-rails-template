
require 'rails_helper'


RSpec.feature "User setting", type: :feature do
  scenario "User can change wall colour" do
    signup_as_new_user("Pam")
    login_as_user("Pam")
<<<<<<< HEAD
    select '#9E764D', from: "Background colour"
    # save_and_open_page
=======
    select 'LawnGreen', from: "Background colour"
>>>>>>> master
    click_button "Lizardify me!"
    within('body') do
    page.body.should have_content ('background-color: LawnGreen')

    end
  end

  scenario "User can change font" do
    signup_as_new_user("Pam")
    login_as_user("Pam")
    select 'Calibri', from: "Font family"
    click_button "Lizardify me!"
    within('body') do
    page.body.should have_content ('font-family: Calibri')

    end
  end
end
