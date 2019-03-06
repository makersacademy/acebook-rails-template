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

def login_clare_noposts
  visit("/users/sign_in")
  fill_in :user_email, with: 'Clare.Noposts@gmail.com'
  fill_in :user_password, with: 'cn1234'
  click_button 'Log in'
end

def sign_up_nellie_nopicture
  visit("/users/sign_up")
  fill_in :user_email, with: 'nellie.nopicture@gmail.com'
  fill_in :user_first_name, with: 'Nellie'
  fill_in :user_last_name, with: 'Nopicture'
  fill_in :user_password, with: 'nn1234'
  fill_in :user_password_confirmation, with: 'nn1234'
  click_button 'Submit'
end

def sign_up_wendy_withpicture
  visit("/users/sign_up")
  fill_in :user_email, with: 'wendy.withpicture@gmail.com'
  fill_in :user_first_name, with: 'Wendy'
  fill_in :user_last_name, with: 'Withpicture'
  fill_in :user_password, with: 'ww1234'
  fill_in :user_password_confirmation, with: 'ww1234'
  page.attach_file("post_image", 'spec/fixtures/imagename.jpg')
  click_button 'Submit'
end
