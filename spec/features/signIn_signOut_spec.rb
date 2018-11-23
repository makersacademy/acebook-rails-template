describe "Sign In" do

  before do
    visit_site_sign_up
    sign_out
  end



  it "signs the user in with correct credentials" do

    sign_in_to_test

    expect(page).to have_content("Log Out from user@user.com")
  end

  it "does not sign in the user if credentials are incorrect" do

    sign_in_to_test(wrong_credentials = true)

    expect(page).to have_content ("Forgot your password")
  end





end

describe "Sign out" do
  before do
    visit_site_sign_up
  end

  it "signs the user out" do

    sign_out

    expect(page).to have_content("Sign Up")
  end
end
