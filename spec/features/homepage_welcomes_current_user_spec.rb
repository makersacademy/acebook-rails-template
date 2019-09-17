feature "Welcome message" do
  scenario "Home page displays welcome message for current user" do
    signup
    expect(page).to have_content(Hello Kaja!)
  end
end
