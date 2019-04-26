# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  include Warden::Test::Helpers

  let(:user) {user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password") }
  
  scenario 'Can delete pre-made posts' do
    login_as(user, :scope => :user)

    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Post!'

    expect(current_path).to eq('/posts')
    expect(page).to have_content('Hello, world!')

    click_link('Delete')
    expect(current_path).to eq('/posts')
    expect(page).not_to have_content('Hello, world!')
  end
end
