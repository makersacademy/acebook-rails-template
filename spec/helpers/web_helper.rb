def create_a_new_post_and_see_it_on_the_feed(text)
  visit '/posts'
  click_link 'New post'
  fill_in 'Message', with: text
  click_button 'Submit'
  expect(page).to have_content(text)
end

def sign_up(email:, username:, password:)
  visit '/users/sign_up'
  fill_in 'Email', with: email
  fill_in 'Username', with: username
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password
  click_button 'Sign up'
end

def sign_in(email:, password:)
  visit '/users/sign_in'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Log in'
end
