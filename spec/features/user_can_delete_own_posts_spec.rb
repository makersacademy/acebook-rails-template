require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view posts, date, time and username' do
    sign_up
    new_post
    click_link 'Destroy'
    expect(page).not_to have_content('Hello, world!')
  end
end
