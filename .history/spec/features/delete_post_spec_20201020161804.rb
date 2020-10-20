require 'rails_helper'

RSpec.feature "Delete", type: :feature do 
  scenario 'user can delete a post' do 
    newpost
    click_link 'Delete'
    expect(page).not_to have_content('Hello world')
  end 
end 