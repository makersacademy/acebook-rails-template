def sign_up
    visit('users/sign_up')
    expect(page).to have_content "Sign up"
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: 'double'
    fill_in "Password confirmation", with: 'double'
    click_button "Sign up"
end

# def sign_in
#     visit('/users/sign_in')
#     fill_in "Email", with: "test@example.com"
#     fill_in "Password", with: "double"
#     click_button "Log in"
# end