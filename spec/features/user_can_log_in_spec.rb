require 'rails_helper'
require './spec/helpers/users_helper_spec'

feature "User can log in" do
  scenario 'A user can login' do
    signup
    login
    expect(page).to have_current_path(users_path)
  end
end
