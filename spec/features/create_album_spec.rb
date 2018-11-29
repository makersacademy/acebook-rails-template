require 'rails_helper'
RSpec.feature 'Creating Album', type: :feature do
  scenario 'user can view their albums' do
    sign_in_as_user
    album = create :album
    click_link 'My Albums'
    expect(page).to have_content "Alice Bobson's Albums"
  end
end
