RSpec.feature "visit home page", type: :feature do
  scenario "can edit the users bio " do
    visit "/"
    expect(page.current_url).to eq("http://www.example.com/")


  end
  scenario "home page has correct content" do
    visit "/"
    expect(page).to have_content("Please Sign Up or Sign In to view the content.")
  end
  scenario "redirected to sign up page" do
    visit "/"
    click_link "Sign up"
    expect(page.current_url).to eq("http://www.example.com/users/sign_up")


  end
end

RSpec.feature "Sign Up page", type: :feature do
  scenario "has correct url" do
    visit "/"
    click_link "Sign up"
    expect(page.current_url).to eq("http://www.example.com/users/sign_up")


  end
  scenario "home page has correct content" do
    visit "/"
    click_link "Sign up"
    expect(page).to have_content("Sign up")
    expect(page).to have_content("Firstname")
    expect(page).to have_content("Lastname")
    expect(page).to have_content("Username")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
    expect(page).to have_content("(6 characters minimum)")
    expect(page).to have_content("Password confirmation")
    expect(page).to have_button("Sign up")
  end
  scenario "Sign up a user" do
    visit "/"
    click_link "Sign up"
    fill_in "Firstname", with: "Ben"
    fill_in "Lastname", with: "Smith"
    fill_in "Username", with: "BenSmith12"
    fill_in "Email", with: "bensmith@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    expect(page).to have_content("Welcome! You have signed up successfully.")


  end
end

RSpec.feature "Logged in features", type: :feature do
  scenario "displays the correct message when signed in/up" do
    visit "/"
    click_link "Sign up"
    fill_in "Firstname", with: "Ben"
    fill_in "Lastname", with: "Smith"
    fill_in "Username", with: "BenSmith12"
    fill_in "Email", with: "bensmith@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_content("Welcome to whateverweregonnacallit!")
  end
  scenario "displays navigation bar buttons onced signed in" do
    visit "/"
    click_link "Sign up"
    fill_in "Firstname", with: "Ben"
    fill_in "Lastname", with: "Smith"
    fill_in "Username", with: "BenSmith12"
    fill_in "Email", with: "bensmith@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    expect(page).to have_link("Home")
    expect(page).to have_link("My Page")
    expect(page).to have_link("Logout")
  end
  scenario "correct url" do
    visit "/"
    click_link "Sign up"
    fill_in "Firstname", with: "Ben"
    fill_in "Lastname", with: "Smith"
    fill_in "Username", with: "BenSmith12"
    fill_in "Email", with: "bensmith@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    expect(page.current_url).to eq("http://www.example.com/")

  end
  scenario "home page has your username and email" do
    visit "/"
    click_link "Sign up"
    fill_in "Firstname", with: "Ben"
    fill_in "Lastname", with: "Smith"
    fill_in "Username", with: "BenSmith12"
    fill_in "Email", with: "bensmith@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    click_link "My Page"
    expect(page).to have_content("Welcome to BenSmith12's profile page")
  end
  scenario "home page has the usernames and email of your account and others who have signed up" do
    visit "/"
    click_link "Sign up"
    fill_in "Firstname", with: "Ben"
    fill_in "Lastname", with: "Smith"
    fill_in "Username", with: "BenSmith12"
    fill_in "Email", with: "bensmith@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    click_link "Logout"
    click_link "Sign up"
    fill_in "Firstname", with: "Paul"
    fill_in "Lastname", with: "Kane"
    fill_in "Username", with: "PaulKane12"
    fill_in "Email", with: "paulkane@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    click_link "Home"
    expect(page).to have_content("BenSmith12")
    expect(page).to have_content("PaulKane12")
  end
  scenario "home page after login has correct url" do
    visit "/"
    click_link "Sign up"
    fill_in "Firstname", with: "Ben"
    fill_in "Lastname", with: "Smith"
    fill_in "Username", with: "BenSmith12"
    fill_in "Email", with: "bensmith@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    click_link "Home"
    expect(page.current_url).to eq("http://www.example.com/profiles")
  end

end
RSpec.feature "Logout", type: :feature do
  scenario "can logout from homepage" do
    visit "/"
    click_link "Sign up"
    fill_in "Firstname", with: "Ben"
    fill_in "Lastname", with: "Smith"
    fill_in "Username", with: "BenSmith12"
    fill_in "Email", with: "bensmith@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    click_link "Home"
    click_link "Logout"
    expect(page).to have_content("Signed out successfully.")

  end
  scenario "can logout just after creating account" do
    visit "/"
    click_link "Sign up"
    fill_in "Firstname", with: "Ben"
    fill_in "Lastname", with: "Smith"
    fill_in "Username", with: "BenSmith12"
    fill_in "Email", with: "bensmith@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    click_link "Logout"
    expect(page).to have_content("Signed out successfully.")
  end
  scenario "logout url is correct" do
    visit "/"
    click_link "Sign up"
    fill_in "Firstname", with: "Ben"
    fill_in "Lastname", with: "Smith"
    fill_in "Username", with: "BenSmith12"
    fill_in "Email", with: "bensmith@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    click_link "Logout"
    expect(page.current_url).to eq("http://www.example.com/")
  end
  scenario "sign in after logging out" do
    visit "/"
    click_link "Sign up"
    fill_in "Firstname", with: "Ben"
    fill_in "Lastname", with: "Smith"
    fill_in "Username", with: "BenSmith12"
    fill_in "Email", with: "bensmith@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    click_link "Logout"
    click_link "Sign up"
    click_link "Log in"
    fill_in "Email", with: "bensmith@gmail.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    expect(page).to have_content("Signed in successfully.")
  end

end

RSpec.feature "My Page features", type: :feature do
  scenario "home page has correct content" do
    visit "/"
    click_link "Sign up"
    fill_in "Firstname", with: "Ben"
    fill_in "Lastname", with: "Smith"
    fill_in "Username", with: "BenSmith12"
    fill_in "Email", with: "bensmith@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    click_link "My Page"
    expect(page).to have_content("Welcome to BenSmith12's profile page")
  end
  scenario "my profile has area for bio" do
    visit "/"
    click_link "Sign up"
    fill_in "Firstname", with: "Ben"
    fill_in "Lastname", with: "Smith"
    fill_in "Username", with: "BenSmith12"
    fill_in "Email", with: "bensmith@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    click_link "My Page"
    expect(page).to have_content("Bio")


  end
  scenario "my profile has area for new posts text" do
    visit "/"
    click_link "Sign up"
    fill_in "Firstname", with: "Ben"
    fill_in "Lastname", with: "Smith"
    fill_in "Username", with: "BenSmith12"
    fill_in "Email", with: "bensmith@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    click_link "My Page"
    expect(page).to have_content("-- Add new post --")


  end
  scenario "my profile page correct content" do
    visit "/"
    click_link "Sign up"
    fill_in "Firstname", with: "Ben"
    fill_in "Lastname", with: "Smith"
    fill_in "Username", with: "BenSmith12"
    fill_in "Email", with: "bensmith@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    click_link "My Page"
    expect(page).to have_content("-- Add new post -- ")
    expect(page).to have_content("Age")
    expect(page).to have_content("Bio")
    expect(page).to have_content("Location")


  end
  scenario "Bio page has submit button" do
    visit "/"
    click_link "Sign up"
    fill_in "Firstname", with: "Ben"
    fill_in "Lastname", with: "Smith"
    fill_in "Username", with: "BenSmith12"
    fill_in "Email", with: "bensmith@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    click_link "My Page"
    expect(page).to have_button("Update")


  end
  scenario "create a post" do
    visit "/"
    click_link "Sign up"
    fill_in "Firstname", with: "Ben"
    fill_in "Lastname", with: "Smith"
    fill_in "Username", with: "BenSmith12"
    fill_in "Email", with: "bensmith@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    click_link "My Page"
    fill_in "post_text", with: "Hello this is my first post"
    click_button "submit"
  end

  scenario "expect created post to now be on My Page" do
    visit "/"
    click_link "Sign up"
    fill_in "Firstname", with: "Ben"
    fill_in "Lastname", with: "Smith"
    fill_in "Username", with: "BenSmith12"
    fill_in "Email", with: "bensmith@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    click_link "My Page"
    fill_in "post_text", with: "Hello this is my first post"
    click_button "submit"
    expect(page).to have_content("Hello this is my first post")
  end
  scenario "expect url to be the same but with users id at the end" do
    visit "/"
    click_link "Sign up"
    fill_in "Firstname", with: "Ben"
    fill_in "Lastname", with: "Smith"
    fill_in "Username", with: "BenSmith12"
    fill_in "Email", with: "bensmith@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    click_link "My Page"
    expect(page.current_url).to have_content("http://www.example.com/profiles/")

  end
end
