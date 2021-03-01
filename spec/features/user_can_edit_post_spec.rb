require 'rails_helper'

RSpec.feature 'Edit posts', type: :feature do
  scenario 'A user can edit an already-written post' do
    register 
    click_link 'New post'
    fill_in 'Message', with: 'This is a post, and I am super cool.'
    click_button("Submit")
    expect(page).to have_current_path('/')
    click_link("Edit this post")
    fill_in 'Message', with: 'This is an updated post, but I am still awesome'
    click_button("Submit")
    expect(page).to have_current_path('/posts')
    expect(page).to have_content("This is an updated post, but I am still awesome")
  end
end