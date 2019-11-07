require 'rails_helper'

RSpec.feature "Likes", type: :feature do
  scenario "Can like posts" do
    signup_as_new_user("Example")
    login_as_user("Example")
    create_new_post("Hello, world!")
    expect(page).to have_content("Hello, world!")
  end

end
