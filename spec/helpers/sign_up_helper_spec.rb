
def sign_up
  visit "users/new"
  fill_in "user[firstname]", with: "Zizi"
  fill_in "user[surname]", with: "Dweng"
  fill_in "user[email]", with: "zizidwengy@email.com"
  fill_in "user[password]", with: "harryisthebest"
  click_button "Submit"
end
