require 'rails_helper'

RSpec.feature "Click users list", type: :feature do
  scenario "Users can display a list of users by clicking users button" do
    sign_up_and_sign_in
    click_link "Users"
    expect(page).to have_content('Clint Pondsworth')
  end
end
