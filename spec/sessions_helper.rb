module SessionsHelper
  def sign_up_as_new_user
    sign_up('Bob', 'bob@bob.com', 'password')
  end

  def sign_up(name, email, password)
    visit '/users/new'
    fill_in 'user[name]', with: name
    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password
    click_button 'Create User'
  end

  def sign_in(email, password)
    visit '/login'
    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    click_button 'Log In'
  end
end
