require 'rails_helper'

RSpec.feature 'Sign up', type: :feature do
  scenario 'Signup form should have email address and password fields' do
    visit '/'
    expect(page).to have_field("user[email_address]")
    expect(page).to have_field("user[password]")
  end
end
