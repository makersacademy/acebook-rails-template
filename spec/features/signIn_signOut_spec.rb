describe "Sign In" do

  before do
    visit_site_sign_up
    sign_out
  end



  it "signs the user in with correct credentials" do

    sign_in_to_test

    expect(page).to have_content("Log Out from user@user.com")
  end
end
