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
