module CapybaraHelpers

  def sign_up
    visit '/users/new'
    fill_in 'user_name', with: 'TestName'
    fill_in 'user_email', with: 'testemail@test.com'
    fill_in 'user_password', with: 'password123'
    fill_in 'user_password_confirmation', with: 'password123'
    click_button 'Create my account'
  end
end

RSpec.configure do |config|
  config.include CapybaraHelpers, type: :feature
end
