require 'rails_helper'

RSpec.feature "Search function", type: :feature do

  before(:all) do 
    visit '/sign_up'
    fill_in 'First name', with: 'Rebecca'
    fill_in 'Surname', with: "Ransome"
    fill_in 'Email', with: "Beckyrose200@aol.com"
    fill_in 'Password', with: "12345678910"
    fill_in 'Password confirmation', with: "12345678910"
    choose('female')
    click_button 'Sign Up'
  end 

  scenario "Can search a user" do
    visit "/posts"
    fill_in "Search by user", with: "Rebecca"
    click_button "Submit"
    expect(page).to have_content("Rebecca Ransome")
  end

  scenario "Can search a user without case sensitivity" do
    visit "/posts"
    fill_in "Search by user", with: "rebecca"
    click_button "Submit"
    expect(page).to have_content("Rebecca Ransome")
  end

  scenario "Shows no search results when user isnt found" do
    visit "/posts"
    fill_in "Search by user", with: "Sophie"
    click_button "Submit"
    expect(page).to have_content("No Search Results")
  end
end 
