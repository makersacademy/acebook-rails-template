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
end
