# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Deleting posts', type: :feature do
  before do
    login(email: 'test@user.com', password: 'qwerty')
  end

  scenario 'User can delete their own post' do
    click_link('I am test user')
    click_button 'Delete'
    expect(page).not_to have_content('I am test user')
  end

  scenario "User cannot delete someone else's post" do
    visit '/'
    click_link('This is test user 2')
    expect(page).not_to have_button('Delete')
  end
end
