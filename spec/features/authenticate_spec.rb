RSpec.context "When a user has not signed up", type: :feature do
  scenario "if they visit another URL, they are redirected to the sign in page" do
    visit '/posts/new'
    expect(current_path).to eq("/users/sign_in")
  end
  scenario "when they do sign up, they are not redirected to the sign in page" do
    perform_valid_sign_up
    visit '/posts/new'
    expect(current_path).to eq("/posts/new")
  end
end
