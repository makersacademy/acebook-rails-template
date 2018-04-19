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

def new_comment
  visit('/comments')
  click_link 'New Comment'
  fill_in 'comment_post_id', with: 1
  fill_in 'comment_body', with: 'text'
  click_on 'Create Comment'
end
