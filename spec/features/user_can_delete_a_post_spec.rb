require 'rails_helper'


RSpec.feature 'delete', type: :feature do

  scenario 'user can see a delete button' do
    add_a_post
    expect(page).to have_content("Delete")
  end

  scenario 'user can see a delete button' do
    add_a_post
    click_link "Delete"
    expect(page).not_to have_content('test message')
  end



end
