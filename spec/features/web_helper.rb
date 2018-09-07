def sign_up_jackbert
  visit '/users/sign_up'
  fill_in 'first name', with: 'Jack'
  fill_in 'last name', with: 'Sparrow'
  fill_in 'email', with: 'js@test.com'
  fill_in 'user_password', with: 'foobar'
  fill_in 'user_password_confirmation', with: 'foobar'
  click_button 'Sign up'
end

def make_a_coffee
  login_as create( :user ), scope: :user
  visit new_post_path  
  attach_file('post[postimage]', "./files/images/caffeine-coffee-cup-6347.jpg")
  fill_in 'post[message]', with: 'Hello, world!'
  click_button 'Create Post'
end

def standard_user_posts
  standard_user = create(:user)
  login_as standard_user
  newpost = Post.create(message: 'Console test', user_id: standard_user.id)
end

def super_user_logs_in
  superadmin_user = create(:user)
  superadmin_user.superadmin_role = true
  login_as superadmin_user
  p superadmin_user
end
