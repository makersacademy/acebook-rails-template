# frozen_string_literal: true

RSpec.describe 'Timeline', type: :feature do
  scenario 'User name is next to the relevant post' do
    sign_up
    create_post
    expect(page).to have_content('@testUser: Hello, world!')
  end
end
