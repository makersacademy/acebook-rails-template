# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users Wall', type: :feature do
  scenario 'User land on their own wall after signup or login' do

    sign_up(name: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password')
    # allow(user).to respond_to(:id)and_return(186)
    user = User.all[0]
    expect(page).to have_current_path("/users/#{user.id}/posts")
  end
end
