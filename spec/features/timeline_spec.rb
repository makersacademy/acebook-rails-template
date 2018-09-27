require 'rails_helper'

RSpec.feature "Timeline", type: :feature do

  before do
    user = User.create(first_name: 'Dave', last_name: 'Whoever', email: 'nojokes@email.com', password: '1234')
    Post.create(message: 'Hi Mathilde!', user_id: user.id)
    Post.create(message: 'Another post', user_id: user.id)
  end

  scenario "User can see all posts" do
    visit "/posts"
    expect(page).to have_content('Hi Mathilde!')
  end

  scenario "Users see posts in reverse-chronological order" do
    visit '/posts'
    expect(page.body.index('Another post')).to be < page.body.index('Hi Mathilde!')
  end

end
