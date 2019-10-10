RSpec.feature "Login", type: :feature do
  scenario "User can login to Acebook" do
    user = User.create(email: 'test@example.com', password: 'abc123')
    visit('/')
    click_link('Log In')
    fill_in "user[email]", with: "test@example.com"
    fill_in "user[password]", with: "abc123"
    click_button('Submit')
    expect(current_path).to eq('/posts')
  end

  scenario "User fails to login with incorrect password" do
    user = User.create(email: 'test@example.com', password: 'abc123')
    visit('/')
    click_link('Log In')
    fill_in "user[email]", with: "test@example.com"
    fill_in "user[password]", with: "different"
    click_button('Submit')
    expect(page).to have_content("Log in details not valid")
    expect(current_path).to eq('/users')
  end
end
