require 'rails_helper'
require './spec/helpers/users_helper_spec'

feature 'User can submit a post' do
  scenario "and view them" do
    newpost
    expect(page).to have_content("Hello, world!")
  end
end
