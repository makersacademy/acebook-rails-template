require 'rails_helper'

RSpec.feature "Homepage", type: :feature do
    scenario 'cannot register if the email address already exists in the database' do
        User.create(name: "stephan", dob: '2020-04-04', cob: 'south africa', mob: 112, email: 'stephan@test.com', password: "password")
        visit '/sign-up'
        fill_in 'fullname', with: "stephan"
        fill_in 'dob', with: "2020-04-04"
        fill_in 'cob', with: "south africa"
        fill_in 'mob', with: 112
        fill_in 'email', with: "stephan@test.com"
        fill_in 'password', with: "password"
        click_button 'Sign up'
        expect(page).to have_content("What kind of nincompoop tries to register twice?")
    end
end