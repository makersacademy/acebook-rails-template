require 'rails_helper'


RSpec.feature "Failing", type: :feature do
  scenario "Can not go to this page " do
    visit "/index"
    click_link "New post"
    expect(page).to have_content("Hello, bla!")
  end
end