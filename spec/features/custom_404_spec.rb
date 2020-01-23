require 'rails_helper'

RSpec.feature "Custom 404", type: :feature do
  scenario 'When a user inputs an invalid user route into the url' do  
    signup
    visit "/9999"
    expect(page).to have_content 'Status 404'
    expect(page).to have_content "Sorry, this user doesn't exist!"
  end
end
