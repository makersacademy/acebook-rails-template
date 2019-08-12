require 'rails_helper'

feature "User can sign up" do
  scenario 'A user wants to create and account to use AceBook' do
    signup
    expect(page).to have_current_path(users_index_path)
  end
end
