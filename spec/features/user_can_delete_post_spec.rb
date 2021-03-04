require 'rails_helper'

RSpec.feature 'Delete posts', type: :feature do
  scenario 'A user can delete their own post' do
    register
    submit_post
    click_link 'Delete'
    expect(page).to_not have_content('Hello, world!')
  end
end
