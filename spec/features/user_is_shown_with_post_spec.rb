# frozen_string_literal: true

RSpec.feature 'Timeline', type: :feature do
  scenario 'Submitted posts should show user' do
    sign_up(email: 'test@email.com', username: 'Troy', password: 'testpass')
    create_a_new_post_and_see_it_on_the_feed("Hello, world!")
    expect(page).to have_content "Troy"
  end
end
