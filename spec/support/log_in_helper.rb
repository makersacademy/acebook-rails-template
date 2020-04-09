module LogInHelper

  def log_in 
    visit '/'
    fill_in 'email', with: 'ruby@rails.com'
    fill_in 'password', with: 'Password'
    click_button 'Log in'
  end

end
