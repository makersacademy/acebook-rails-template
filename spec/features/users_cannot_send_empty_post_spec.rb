require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  scenario 'should not be able to send empty posts' do
    sign_up(email: 'test@email.com', username: 'Troy', password: 'testpass')
    create_a_new_post_and_see_it_on_the_feed("")
    expect(page).to have_content("Cannot post an empty message!")
  end
end
