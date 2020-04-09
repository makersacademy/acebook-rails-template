module SignUpHelper

  def sign_up 
    visit '/'
    fill_in 'email', with: 'ruby@rails.com'
    fill_in 'password', with: 'Password'
    fill_in 'password_confirmation', with: 'Password'
    click_button 'Sign up'
  end

end
