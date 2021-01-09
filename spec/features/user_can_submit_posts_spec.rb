require 'rails_helper'
require_relative '../../app/models/post'
require 'date'

describe 'Timeline' do
  it 'Can submit posts and view them' do
    visit '/posts'
    fill_in 'post[message]', with: 'Hello, world!'
    click_button 'Post'
    expect(page).to have_content('Hello, world!')
    date = DateTime.now.strftime('%d %b %Y')
    expect(page).to have_content(date)
  end

  it 'Posts show the date they were created' do
    Post.create(message: 'Hello, World!', created_at: DateTime.new(2021, 1, 3, 1, 3, 3))
    visit '/posts'
    expect(page).to have_content('3 Jan 2021')
  end
end
