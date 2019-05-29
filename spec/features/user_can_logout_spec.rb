RSpec.feature "Can log out", type: :feature do
  let(:first_name) { 'Bob' }
  let(:last_name) { 'Geldof' }
  let(:email) { 'its.me@bobgeldof.com' }
  let(:password) { 'bob123' }

  scenario "user can log out after they have logged in" do
    sign_up
    log_in
    expect(page).to have_content 'New post'
    click_link('Log out')
    expect(page).to have_selector("input[type=submit][value='Log in']")
  end
end
