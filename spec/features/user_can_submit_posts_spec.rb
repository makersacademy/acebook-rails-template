# frozen_string_literal: true

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    sign_up(email: 'test@email.com', password: 'testpass')
    create_a_new_post_and_see_it_on_the_feed("Hello, world!")
  end

  scenario 'Posts are shown in order of creation' do
    sign_up(email: 'test@email.com', password: 'testpass')
    create_a_new_post_and_see_it_on_the_feed("Hello, world!")
    create_a_new_post_and_see_it_on_the_feed("I am first")
    expect(page.all('.post')[0]).to have_content 'I am first'
  end
end
