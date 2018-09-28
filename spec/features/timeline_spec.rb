require 'rails_helper'

RSpec.feature "Timeline", type: :feature do

  before do
    customer = Customer.create(email: 'nojokes@email.com', password: '123456')
    Post.create(message: 'Hi Mathilde!', customer_id: customer.id)
    Post.create(message: 'Another post', customer_id: customer.id)
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
