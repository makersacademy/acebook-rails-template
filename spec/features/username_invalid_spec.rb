RSpec.feature 'Username', type: :feature do
  scenario 'User cannot sign up with a username that already exists' do
    sign_up(email: 'test@email.com', username: "Troy", password: 'testpass')
    click_link "Sign out"
    sign_up(email: 'test2@email.com', username: "Troy", password: 'testpass')
    expect(page).to have_content('Username already exists!')
  end
end
