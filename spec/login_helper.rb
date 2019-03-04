def login_george_manyposts
  visit("/users/sign_in")
  fill_in :user_email, with: 'George.Manyposts@gmail.com'
  fill_in :user_password, with: 'gm1234'
  click_button 'Log in'
end

def login_percy_onepost
  visit("/users/sign_in")
  fill_in :user_email, with: 'Percy.Onepost@gmail.com'
  fill_in :user_password, with: 'po1234'
  click_button 'Log in'
end

def login_sarah_fewposts
  visit("/users/sign_in")
  fill_in :user_email, with: 'Sarah.Fewposts@gmail.com'
  fill_in :user_password, with: 'sf1234'
  click_button 'Log in'
end
