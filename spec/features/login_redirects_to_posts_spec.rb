require 'rails_helper'

RSpec.feature "Redirect to Posts", type: :feature do
    scenario "Can see posts after logging in" do
        log_in
        expect(page).to have_selector('ul#posts')
    end
end