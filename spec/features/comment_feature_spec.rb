require 'rails_helper'

RSpec.feature "Comments", type: :feature do
    scenario 'can comment on other peoples posts' do
        User.create(name: "stephan", dob: '2020-04-04', cob: 'south africa', mob: 112, email: 'stephan@test.com', password: "password")
        visit '/'
        fill_in 'email', with: "stephan@test.com"
        fill_in 'password', with: "password"
        click_button 'Sign In'
        visit '/home'
        click_link 'Make a new post'
        fill_in 'message', with: 'This is a new post'
        click_button 'Submit Post'
        expect(page).to have_content("This is a new post")
    end
end