# frozen_string_literal: true

feature 'user 404' do
  scenario 'a user access a url that does not correspond to a existing user' do
    sign_up
    visit('/users/10')
    expect(page).to have_content("The user you were looking for doesn't exist")
  end
end
