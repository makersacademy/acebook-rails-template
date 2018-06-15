def sign_up_and_sign_in
  visit "/posts"
  click_link "Sign up"
  fill_in "First name", with: 'Clint'
  fill_in "Last name", with: 'Pondsworth'
  fill_in "Username", with: 'GoldFish'
  fill_in "Email", with: "example@hotmail.com"
  fill_in "Password", with: "123456"
  fill_in "Password confirmation", with: "123456"
  click_button "Sign up"
end

def sign_up_and_sign_in_2
  visit "/posts"
  click_link "Sign up"
  fill_in "First name", with: 'Betty'
  fill_in "Last name", with: 'Crocker'
  fill_in "Username", with: 'Tuna'
  fill_in "Email", with: "tuna@hotmail.com"
  fill_in "Password", with: "654321"
  fill_in "Password confirmation", with: "654321"
  click_button "Sign up"
end

def sign_up_and_sign_in_other_user
  visit "/posts"
  click_link "Sign up"
  fill_in "First name", with: 'Louise'
  fill_in "Last name", with: 'Fisherman'
  fill_in "Username", with: 'Plankton'
  fill_in "Email", with: "example@gmail.com"
  fill_in "Password", with: "654321"
  fill_in "Password confirmation", with: "654321"
  click_button "Sign up"
end

def make_a_text_post
  fill_in "Message", with: "Hello, world!"
  click_button "Submit"
end

def make_a_profile_post
  fill_in "Message", with: "Not my profile"
  click_button "Submit"
end

def make_a_text_and_picture_post
  fill_in "Message", with: "Hello fish"
  page.attach_file("post_image", Rails.root + 'app/assets/images/fish.jpeg')
end

def set_and_freeze_time
  Time.zone = 'London'
  new_time = Time.local(2016, 6, 10, 12, 0, 0).strftime("%e %B %Y %H:%M")
  Timecop.freeze(new_time)
end
