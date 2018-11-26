def signup
  visit '/'
  fill_in(:user_firstname, with: 'Winnie')
  fill_in(:user_lastname, with: 'Pooh')
  fill_in(:user_username, with: 'winnie')
  fill_in(:user_email, with: 'winnie-the-pooh@100acrewoods.com')
  fill_in(:user_password, with: 'winnie')
  click_button 'Sign up'
end
