require 'rails_helper'

RSpec.feature "Delete post", type: :feature do 
    scenario "user can delete a post" do
        User.create(name: "Gina", password: "123456", email: "gina@example.com")
        log_in_gina
        send_post_hello
        click_on "Delete post"
        expect(page).not_to have_content("Hello")
    end
end
