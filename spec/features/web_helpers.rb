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

def make_a_text_post
 fill_in "Message", with: "Hello, world!"
 click_button "Submit"
end

def make_a_text_and_picture_post
 fill_in "Message", with: "Hello fish"
 page.attach_file("post_image", Rails.root + 'app/assets/images/fish.jpeg')
end
