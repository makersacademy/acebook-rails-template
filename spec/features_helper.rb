  def signup
    visit "/"
      click_button "Sign Up"
      fill_in "user[email]", with: "test@test.com"
      fill_in "user[password]", with: "123456"
      click_button "Save User"
  end

  def login
    click_button "Login"
    fill_in "email", with: "test@test.com"
    fill_in "password", with: "123456"
    click_button "Login"
  end

  def create_post
    click_link "New post"
    fill_in "post[message]", with: "Hello, world!"
    click_button "Create Post"
  end

  def create_comment
    fill_in "comment[body]", with: "I love this post!!!"
    click_button "Create Comment"
  end
