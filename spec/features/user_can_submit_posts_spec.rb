require 'rails_helper'
require './spec/helpers/users_helper_spec'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    newpost
    expect(page).to have_content("Marvin Marvin")
  end
end
