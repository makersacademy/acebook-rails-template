require 'rails_helper'
require 'simple_send_keys'
RSpec.feature 'Delete posts', type: :feature, js: true do
  scenario 'user can delete a post' do
    user_sign_up
    create_new_post('Needs to be deleted')
    page.evaluate_script('window.confirm = function() { return true; }')
    click_link('Delete')
    expect(page).not_to have_content('Needs to be deleted')
  end
end
