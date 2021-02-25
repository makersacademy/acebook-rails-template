def create_a_new_post_and_see_it_on_the_feed(text)
  visit '/posts'
  click_link 'New post'
  fill_in 'Message', with: text
  click_button 'Submit'
  expect(page).to have_content(text)
end