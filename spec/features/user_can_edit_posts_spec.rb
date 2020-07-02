require 'rails_helper'
require_relative '../support/features/post_helpers.rb'

RSpec.feature "Edit", type: :feature do
    scenario "user can edit their own posts" do
        creates_a_post
        click_link "update"
        expect(page).to have_content(/bob1.*Hello, world!/)
    end

    scenario "edited post appears in post list" do
        creates_a_post
        click_link "update"
        fill_in "Message", with: "Hello, Brainaics!"
        click_on "Submit"
        expect(page).to have_content("bob1 Hello, Brainaics!")
    end
end