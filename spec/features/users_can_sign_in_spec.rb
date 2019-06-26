require 'rails_helper'
require_relative '../helpers/signing_up_spec'

RSpec.feature 'Signin', type: :feature do
  scenario 'User should be able to sign and redirected to their wall' do
    sign_up_user
    sign_in_user
    user = User.find_by(email: 'lisa@email.com')
    expect(current_path).to eq("/users/#{user.id}")
    expect(page).to have_content("Lisa")
  end
end 
