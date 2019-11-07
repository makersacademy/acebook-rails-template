require 'rails_helper'

RSpec.feature "User is not signed in", type: :feature do

    scenario "Visit /posts without signing in" do
      visit('/posts')
      expect(page).to have_current_path('/')
    end
end
