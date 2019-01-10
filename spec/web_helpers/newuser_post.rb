def createUser(
  username: "test",
  firstname: "Wayne",
  lastname: "Ably",
  birthday: "10/10/1980",
  email: "maybe@test.com"
  )

  User.create({
    email: email,
    password: "hello2",
    username: username,
    firstname: firstname,
    lastname: lastname,
    birthday: birthday
    })

end

def login(email: "maybe@test.com", password: "hello2")
  visit "/users/sign_in"
  fill_in "Email", with: email
  fill_in "Password", with: password
  click_button "Log in"
end

def postMessage(content: "This is a post")
  visit "/posts"
  click_link "New post"
  fill_in "Message", with: content
  click_button "Submit"
end
