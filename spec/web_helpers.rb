def sign_up_student
  visit "/"
  click_link "Student Login"
  click_link "Sign up"
  fill_in "First name", with: "Test"
  fill_in "Last name", with: "Testerson"
  fill_in "Email", with: "test123@student.com"
  fill_in "Password", with: "12345q"
  fill_in "Password confirmation", with: "12345q"
  click_button "Sign up"
end

def sign_in_student
  visit "/"
  click_link "Student Login"
  fill_in "Email", with: "test123@student.com"
  fill_in "Password", with: "12345q"
  click_button "Log in"
end

def sign_up_mentor
  visit "/"
  click_link "Mentor Login"
  click_link "Sign up"
  fill_in "First name", with: "Test"
  fill_in "Last name", with: "Testerson"
  fill_in "Email", with: "test123@mentor.com"
  fill_in "Password", with: "12345q"
  fill_in "Password confirmation", with: "12345q"
  click_button "Sign up"
end

def sign_in_mentor
  visit "/"
  click_link "Mentor Login"
  fill_in "Email", with: "test123@mentor.com"
  fill_in "Password", with: "12345q"
  click_button "Log in"
end

def create_category
  click_link "Forum"
  click_link "Create A New Category"
  fill_in "Name", with: "Exams"
  click_button "Create"
end

def sign_out
  click_link "Log out"
end

def add_student
  fill_in "mentor[student_email]", with: "test123@student.com"
  click_button "Add Student"
end

def send_message
  click_link "Chat"
  click_link "test123@student.com"
  fill_in "message[body]", with: "test message"
  click_button "Send"
end