def sign_up
  visit "/"
  click_button "navdropdown"
  click_link "Sign up"
  fill_in "Email", with: "gandalf@middleearth.org"
  fill_in "Password", with: "shadowfax"
  fill_in "Password confirmation", with: "shadowfax"
  fill_in "First name", with: "Gandalf"
  fill_in "Surname", with: "The Grey"
  click_button "Sign up"
end

def sign_up_second_user
  visit "/"
  click_button "navdropdown"
  click_link "Sign up"
  fill_in "Email", with: "gandalf2@middleearth.org"
  fill_in "Password", with: "shadowfax2"
  fill_in "Password confirmation", with: "shadowfax2"
  fill_in "First name", with: "Gandalf Jr"
  fill_in "Surname", with: "The Grey Jr"
  click_button "Sign up"
end

def sign_up_and_go_to_new_post
  sign_up
  visit "/posts"
  click_link "New Post"
end

def sign_up_and_go_to_new_comment
  sign_up 
  visit "/posts"
  click_
