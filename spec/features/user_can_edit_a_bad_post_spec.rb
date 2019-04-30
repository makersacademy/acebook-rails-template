
require 'rails_helper'

RSpec.feature "Timeline", type: :feature do

#   let(:user) {user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password") }

  scenario 'Can update pre-made posts' do
    sign_up_helper('test@gmail.com', '123')
    log_in_helper('test@gmail.com', '123')
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'

    expect(current_path).to eq('/posts')
    expect(page).to have_content('Hello, world!')

    click_link('edit post')

    fill_in 'Message', with: 'Hey legendz'

    click_button('Submit')

    expect(current_path).to eq('/posts')
    expect(page).to have_content('Hey legendz')
  end
end