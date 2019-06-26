require 'rails_helper'

RSpec.feature 'Redirect visitor', type: :feature do
  scenario 'From posts/index to signin page' do
    visit('/posts')
    expect(current_path).to eq('/')
  end

  scenario 'From posts/index to signin page' do
    sign_up_user
    user = User.find_by(email: 'lisa@email.com')
    visit("/users/#{user.id}")
    expect(current_path).to eq('/')
  end
end