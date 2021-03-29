
def sign_up_as_testy(email = 'test@test.com')
  visit('/users/sign_up')
  fill_in('Name', with: 'Testy')
  fill_in('Surname', with: 'Testerson')
  fill_in('Email', with: email)
  fill_in('Password', with: 'Password12')
  fill_in('Password confirmation', with: 'Password12')
  click_button('Sign up')
end

def sign_up_as_specy
  visit('/users/sign_up')
  fill_in('Name', with: 'Specy')
  fill_in('Surname', with: 'Specerson')
  fill_in('Email', with: 'spec@spec.com')
  fill_in('Password', with: 'Password12')
  fill_in('Password confirmation', with: 'Password12')
  click_button('Sign up')
end

def sign_up_as_testy_and_log_out
  sign_up_as_testy
  click_button('Sign out')
end

