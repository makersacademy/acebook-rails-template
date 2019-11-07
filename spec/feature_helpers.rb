def create_new_post(post)
  fill_in "post[content]", with: post
  click_button "Submit"
end

def signup_as_new_user(user)
  visit "/"
  click_button "Create Account"
  fill_in "user[username]", with: "#{user}-Lizard"
  fill_in "user[password]", with: "password"
  fill_in "user[email]", with: "#{user}@lizard.com"
  fill_in "user[full_name]", with: "Dr #{user} Lizard"
  select "Gecko", :from => "user[lizard_species]"
  fill_in "user[birthday]", with: "01/01/2019"
  fill_in "user[profile_picture]", with: "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png"
  click_button "Create Account"
  click_link "LogOut"
end

def login_as_user(user)
  fill_in "email", with: "#{user}@lizard.com"
  fill_in "Password", with: "password"
  click_button "Login"
end
