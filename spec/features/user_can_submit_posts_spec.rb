require 'rails_helper'
require 'simple_send_keys'
require 'timecop'

RSpec.feature 'Timeline', type: :feature, js: true do
  scenario 'Can submit posts and view them' do
    user_sign_up
    create_new_post('Hello world!')
    expect(page).to have_content('Hello world!')
  end

  scenario 'Can see the newest post first' do
    user_sign_up
    create_new_post('Hello World')
    create_new_post('Good morning')
    expect(page_first_content).to have_content('Good morning')
  end

  scenario 'Can see the post with date and time' do
    user_sign_up
    Timecop.travel(Time.local(2008, 5, 15, 10, 0, 0))
    create_new_post('Good morning')
    Timecop.return
    expect(page).to have_content("Good morning On May 15 2008, 9:00am")
  end

  scenario 'Can submit a multi-line post and view it' do
    user_sign_up
    click_link 'New post'
    find_field('post_message').send_keys("[This, enter, is, enter, a, enter, multi-line, enter, post]")
    click_button 'Submit'
    expect(page.html).to include("This\n<br>is\n<br>a\n<br>multi-line\n<br>post")
  end

  scenario 'redirect to sign in page when not logged in' do
    visit '/posts'
    expect(page.current_path).to eq '/users/sign_in'
  end

  scenario 'user can sign up' do
    user_sign_up
    expect(page.current_path).to eq '/posts'
  end

  scenario "confirmation message is being displayed first time after signing up" do
    visit "/posts"
    user_sign_up
    expect(page).to have_content("Sign in succesful")
  end

  scenario "confirmation message is not being displayed constantly" do
    visit "/posts"
    user_sign_up
    create_new_post("Hello wolrd")
    expect(page).not_to have_content("Sign in succesful")
  end
end
