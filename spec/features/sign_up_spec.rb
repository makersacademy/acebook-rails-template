require 'rails_helper'
require 'test_helper'

feature 'sign up' do
  scenario 'user can sign up with email and password' do
    sign_up
    expect(page).to have_current_path '/'
    expect(page).to have_content 'Hello World'
    expect(page).to have_content 'Signed in as: dan@test.com'
  end
end
