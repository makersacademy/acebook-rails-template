module SessionsHelper
  def login_as_new_user
    sign_up('Bob', 'bob@bob.com', 'password')
  end

  def sign_up(name, email, password)
    visit '/users/new'
    fill_in 'name', with: name
    fill_in 'email', with: email
    fill_in 'password', with: password
    fill_in 'confirmation', with: password
    click_button 'Create User'
  end

  def sign_in(email, password)

  end
end
