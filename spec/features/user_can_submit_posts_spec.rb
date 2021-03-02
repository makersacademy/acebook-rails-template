# frozen_string_literal: true

RSpec.describe 'Timeline', type: :feature do
  it 'Can submit posts and view them' do
    sign_up
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')
  end
end
