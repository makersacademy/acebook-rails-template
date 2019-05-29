def sign_up
  visit "/users/new"
  fill_in('user[first_name]', with: first_name)
  fill_in('user[last_name]', with: last_name)
  fill_in('user[email]', with: email)
  fill_in('user[password]', with: password)
  click_button('Signup')
end

def log_in
  fill_in('session[email]', with: email)
  fill_in('session[password]', with: password)
  click_button('Log in')
end
