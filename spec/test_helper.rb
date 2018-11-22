def sign_in_to_test()
  RAILS_ENV=test
  tester = User.new
  tester.username = "tester"
  tester.email = "test@test.com"
  tester.password = ""
end
