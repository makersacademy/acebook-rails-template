require 'rails_helper'

RSpec.feature 'Edit Post', type: :feature do
  scenario 'Cannot edit a post after 10mins' do
    create_message
    click_link 'Edit', wait: 600
    expect(page).to have_content('You can only edit posts 10 minutes after it has been created')
  end
end