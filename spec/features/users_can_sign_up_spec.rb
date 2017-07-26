require 'rails_helper'
require_relative 'users_helpers'

RSpec.feature "Sign up", type: :feature do
  scenario "A new person can sign up on acebook" do
    expect { sign_up }.to change(User, :count).by(1)
  end

end
