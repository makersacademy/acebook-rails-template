def create_post
  user = User.create(name: 'matt', email:'mdwareing@gmail.com', password: 'test12345')
  visit new_user_post_path(user)
  fill_in "Message", with: "Hello, world!\n This is a post with multiple \n lines"
  click_button "Submit"
end