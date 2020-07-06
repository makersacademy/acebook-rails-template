

def sign_up
  user = User.create!(:email => 'tests@example.com', :password => 'f4k3p455w0rd')
  visit ('/')
  login_as(user, :scope => :user)
  click_button("Sign in")
end


