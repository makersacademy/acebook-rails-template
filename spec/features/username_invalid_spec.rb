RSpec.feature 'Username', type: :feature do
  scenario 'User cannot sign up with a username that already exists' do
    sign_up(email: 'test@email.com', username: "Troy", password: 'testpass')
    click_link "Sign out"
    sign_up(email: 'test2@email.com', username: "Troy", password: 'testpass')
    expect(page).to have_content('Username already exists!')
  end

  scenario 'User cannot sign up with a blank username' do
    sign_up(email: 'test@email.com', username: "", password: 'testpass')
    expect(page).to have_content("Username can't be blank")
  end

  scenario 'User cannot sign up with an invaild username' do
    sign_up(email: 'test@email.com', username: "@", password: 'testpass')
    expect(page).to have_content("Username is invalid")
  end
end
