def fill_in_database(message)
  post :create, params: { post: { message: message } }
end

def create_new_post(post)
  click_link 'New post'
  fill_in 'Message', with: post
  click_button 'Submit'
end

def page_first_content
  page.first('.msg').text
end

def user_sign_up
  visit '/posts'
  expect(page.current_path).to eq '/users/sign_in'
  click_link('Sign up')
  fill_in('user_email', with: 'test@test.com')
  fill_in('user_password', with: 'testing123')
  fill_in('user_password_confirmation', with: 'testing123')
  click_button 'Sign up'
end

def second_user_sign_up
  visit '/posts'
  expect(page.current_path).to eq '/users/sign_in'
  click_link('Sign up')
  fill_in('user_email', with: 'test2@test.com')
  fill_in('user_password', with: 'testing123')
  fill_in('user_password_confirmation', with: 'testing123')
  click_button 'Sign up'
end
