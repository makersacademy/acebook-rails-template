def sign_up_jackbert
  visit '/users/sign_up'
  fill_in 'First name', with: 'Jack'
  fill_in 'Last name', with: 'Sparrow'
  fill_in 'Email', with: 'js@test.com'
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
