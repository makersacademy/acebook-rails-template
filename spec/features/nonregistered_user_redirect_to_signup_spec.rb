require 'rails_helper'
require 'test_database_helper'

feature 'non regisered user goes to sig up' do
  scenario 'if a user goes to any other path he is redirected to sign up' do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    logout(:user)
    visit '/posts'
    expect(page).to have_current_path('/users/sign_in')
  end
end
