require 'rails_helper'

describe 'Non-signed in user', type: :feature do 
  scenario "won't be able to make a new post" do 
    visit('/')
    expect(page).to_not have_content('New post')
  end 
end 