# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Cannot update another persons posts' do
    sign_up_helper('my@name.com', '123ABC')
    log_in_helper('my@name.com', '123ABC')
    new_post_helper('This is my post. There are many like it, but this one is mine')

    expect(current_path).to eq('/posts')
    expect(page).to have_content('This is my post. There are many like it, but this one is mine')

    click_button 'Log out'

    sign_up_helper('new@name.com', '654321')
    log_in_helper('new@name.com', '654321')

    expect(page).to have_content('This is my post. There are many like it, but this one is mine')

    editID = Post.find_by(message: 'This is my post. There are many like it, but this one is mine').id

    find_button("edit_#{editID}").click

    expect(current_path).to_not eq('/edit')
    expect(page).to have_button('Log out')
  end

  scenario 'Receives a useful error message when editing someone elses post' do
    sign_up_helper('my@name.com', '123ABC')
    log_in_helper('my@name.com', '123ABC')
    new_post_helper('This is my post. There are many like it, but this one is mine')

    expect(current_path).to eq('/posts')
    expect(page).to have_content('This is my post. There are many like it, but this one is mine')

    click_button 'Log out'

    sign_up_helper('new@name.com', '654321')
    log_in_helper('new@name.com', '654321')

    editID = Post.find_by(message: 'This is my post. There are many like it, but this one is mine').id

    find_button("edit_#{editID}").click
    expect(page).to have_content('You can only edit posts that you created. Classic Roku.')
  end
end
