require 'rails_helper'
require 'test_helper'

RSpec.feature "Timeline", type: :feature do
  scenario 'can edit posts' do
    sign_up
    new_post
    click_on 'Edit'
    fill_in "post[message]", with: 'Updated message'
    click_on 'Update Post'
    expect(page).to have_content('Updated message')
  end

  # scenario 'unable to edit post more than 10 minutes after creation' do
  #   sign_up
  #   new_post
  #   time_of_creation = Time.now
  #   time_of_editing = Time.now + 11
  #   expect(page).not_to have_content()
end
