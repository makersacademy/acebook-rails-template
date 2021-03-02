# frozen_string_literal: true

RSpec.feature 'Timeline', type: :feature do
  scenario 'Submitted posts should show date and time' do
    sign_up(email: 'test@email.com', password: 'testpass')
    create_a_new_post_and_see_it_on_the_feed("Hello, world!")
    expect(Time.zone.now - first('.date').text.to_datetime).to be < 60
  end
end
