require 'rails_helper'

RSpec.feature "You can see post authors", type: :feature do
  scenario "Can submit posts and view them" do
    User.create(name: "Gina", password: "123456", email: "gina@example.com")
    log_in_gina
    send_post_hello
    expect(page).to have_content "Welcome to your wall, Gina"
  end
end
