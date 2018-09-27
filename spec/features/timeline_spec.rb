require 'rails_helper'

RSpec.feature "Timeline", type: :feature do

  before do
    user = User.create(first_name: 'Dave', last_name: 'Whoever', email: 'nojokes@email.com', password: '1234')
    post = Post.create(message: 'Hi Mathilde!', user_id: user.id)
  end

  scenario "User can see all posts" do
    visit "/posts"
    expect(page).to have_content('Hi Mathilde!')
  end

end
