describe "Sign In" do

  before do
    visit_site_sign_up
    sign_out
  end

  it "signs the user in with correct credentials" do
    sign_in_to_test
    expect(page).to have_content("Welcome username123")
  end

  it "does not sign in the user if credentials are incorrect" do
    sign_in_to_test(wrong_credentials = true)
    expect(page).to have_content ("Forgot your password")
  end

  # it "redirects to users timeline after signing in" do
  #   sign_in_to_test
  #
  #   expect(page).to have_content("tester's timeline")
  # end
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
