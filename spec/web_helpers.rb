def sign_up
    visit('users/sign_up')
    expect(page).to have_content "Sign up"
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: 'double'
    fill_in "Password confirmation", with: 'double'
    click_button "Sign up"
end

def sign_in
    visit('/users/sign_in')
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "double"
    click_button "Log in"
end

def make_test_post
    visit ('/')
    click_link "New post"
    fill_in 'post_message', with: "this is a unique test post"
    click_button "Submit"
end
