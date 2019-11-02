def signing_up
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: 'sarah@test.com'
  fill_in 'Password', with: 'qwerty'
  fill_in 'Password confirmation', with: 'qwerty'
  click_button 'Sign up'
end

def create_post
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: "Hello Robbie"
  click_button "Submit"
end
