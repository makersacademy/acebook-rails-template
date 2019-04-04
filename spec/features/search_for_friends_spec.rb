feature "Search for frineds" do
  scenario "Sign in and find a firend" do
    visit "/"
    fill_in "Username", with: "bobby"
    fill_in "Password", with: "boblord95"
    click_button "Signin"
    expect(current_path).to eq "/posts"
    fill_in "search", with: "Cau"
    expect(page).to have_content "Cauliflower"
  end
end
