RSpec.feature "Login", type: :feature do
    before(:each) do
      signup
    end 

    scenario "Can successfully log in" do
      visit "/" 
      click_link "Log Out"
      click_link "Log In"
      fill_in "Email", with: "mrtester@test.com"
      fill_in "Password", with: "test123"
      click_button "Log In"
      expect(page).to have_content("Logged in as: mrtester@test.com")
    end 

    scenario "Will throw an error if email is correct but password is wrong" do
      visit "/" 
      click_link "Log Out"
      click_link "Log In"
      fill_in "Email", with: "mrtester@test.com"
      fill_in "Password", with: "testabc"
      click_button "Log In"
      expect(page).to have_content("Log In")
    end 

    scenario "Will throw an error if email is incorrect" do
      visit "/" 
      click_link "Log Out"
      click_link "Log In"
      fill_in "Email", with: "mrblobby@test.com"
      fill_in "Password", with: "test123"
      click_button "Log In"
      expect(page).to have_content("Log In")
    end 
    
  end