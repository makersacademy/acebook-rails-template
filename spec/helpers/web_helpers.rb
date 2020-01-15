def sign_up
  visit "/"
  click_on "Sign up"
  fill_in "First name", with: "David"
  fill_in "Surname", with: "Bacall"
  fill_in "Email", with: "dbacall@hotmail.co.uk"
  fill_in "Password", with: "password"
  within ".submit-field" do
    click_on "Sign up"
  end
end

def sign_in(email, password)
  visit '/'
  fill_in "Email", with: email
  fill_in "Password", with: password
  within ".submit-field" do
    click_on 'Sign in'
  end
end
