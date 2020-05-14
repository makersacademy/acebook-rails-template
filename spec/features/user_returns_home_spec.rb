require 'rails_helper'


RSpec.feature 'user can return home', type: :feature do

    scenario "user can return to home page from wall" do
        User.create(name: "Gina", password: "123456", email: "gina@example.com")
        log_in_gina
        click_on "Home"
        expect(page).to have_content('GAPAGbook')
    end
end

