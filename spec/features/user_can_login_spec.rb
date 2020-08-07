require 'rails_helper'
require 'features_helper'

RSpec.feature "Login", type: :feature do
  scenario "user can login" do
    signup
    login
    expect(page).to have_content("test's Wall")
  end
end
