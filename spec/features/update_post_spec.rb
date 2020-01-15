require 'rails_helper'
require 'test_helper'

RSpec.feature "Timeline", type: :feature do
  scenario 'can update posts' do
    sign_up
    new_post
    click_on 'Update'
    fill_in "Update", with: 'Updated message'
    click_on 'Submit'
    expect(page).to have_content('Updated message')
  end
end
