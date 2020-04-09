require 'rails_helper'

RSpec.feature "login", type: :feature do
    scenario 'Can log in and be greeted with a personalised welcome message' do
        User.create(name: "stephan", dob: '2020-04-04', cob: 'south africa', mob: 112, email: 'stephan@test.com', password: "password")
        visit '/'
        fill_in 'email', with: "stephan@test.com"
        fill_in 'password', with: "password"
        click_button 'Sign In'
        expect(page).to have_content("Hello stephan")
    end

    scenario 'cannot login with invalid credentials' do
      User.create(name: "stephan", dob: '2020-04-04', cob: 'south africa', mob: 112, email: 'stephan@test.com', password: "password")
      visit '/'
      fill_in 'email', with: "stephan@test.com"
      fill_in 'password', with: "wrongPassword"
      click_button 'Sign In'
      expect(page).to have_content("Wrong email or password, you silly fool!")
  end
end