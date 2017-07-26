require 'rails_helper'
require_relative 'users_helpers'

RSpec.feature "Sign up", type: :feature do
  scenario "A new person can sign up on acebook" do
    expect { sign_up }.to change(User, :count).by(1)
  end

  scenario "Input fields cannot be blank" do
    expect { sign_up(name: nil) }.to_not change(User, :count)
    expect { sign_up(email: nil) }.to_not change(User, :count)
    expect { sign_up(password: nil) }.to_not change(User, :count)
    expect { sign_up(password_confirmation: nil) }.to_not change(User, :count)
  end

  scenario "Password and password confirmation must match" do
    expect { sign_up(password: "wrong") }.to_not change(User, :count)
  end

  scenario "Email must be correctly formatted" do
    expect { sign_up(email: "not a valid email") }.to_not change(User, :count)
  end

  describe "Duplicate details" do
    xscenario "Email address must be unique" do
      sign_up
      expect { sign_up }.to_not change(User, :count)
    end
  end
end
