require 'rails_helper'

RSpec.feature 'Deleting a Post', type: :feature do
  before do
    sign_in_helper
  end

  scenario 'User can submit a post then delete it' do
    visit('/')
    create_post('This is a rubbish post')
    click_link('Delete')
    expect(page).not_to have_content('This is a rubbish post')
  end
end
