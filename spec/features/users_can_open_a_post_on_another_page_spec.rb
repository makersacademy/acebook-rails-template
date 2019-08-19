require 'rails_helper'
require './spec/helpers/users_helper_spec'

RSpec.feature "Timeline", type: :feature do
  scenario "Can open posts on a new page" do
    signup
    newpost
    click_link 'Marvin Marvin'
    expect(page).to have_content('Marvin Marvin')
  end
end
