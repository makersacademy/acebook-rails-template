require 'rails_helper'

RSpec.feature "photo_album", type: :feature do
  scenario "create and view album" do
    register
    create_album
    expect(page).to have_content("a few potates")
  end
end


