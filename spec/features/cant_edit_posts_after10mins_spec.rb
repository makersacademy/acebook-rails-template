require 'rails_helper'


RSpec.feature 'Edit Post', type: :feature do
  scenario 'Cannot edit a post after 10mins' do
    create_message
    travel(700) do
      click_link 'Edit'
    end
    expect(page).to have_text('You can only edit posts 10 minutes after it has been created')
  end
end