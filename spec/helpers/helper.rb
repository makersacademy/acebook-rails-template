def sign_up
  visit('/users/sign_up')
  fill_in 'Email', with: 'exsample@mail.com'
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
  click_button 'Sign up'
end

def new_post
  visit('/posts')
  click_on 'New Post'
  fill_in 'Message', with: 'blah blah'
  click_on 'Create Post'
end
