require 'rails_helper'

RSpec.feature "Wall says who it belongs to", type: :feature do
  scenario "Walls gives the name of the user it belongs to" do
    @gina = User.create(name: "Gina", password: "123456", email: "gina@example.com")
    @alex = User.create(name: "Alex", password: "abcdef", email: "alex@example.com")
    log_in_gina
    visit "/users/#{@alex.id}"
    expect(page).to have_content("Alex's Wall")   
  end
end