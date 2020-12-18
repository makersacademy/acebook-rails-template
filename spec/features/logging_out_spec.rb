feature 'logging out' do
  scenario 'user is logged in, then logs out' do
    User.create(
      username: 'Malachi',
      email: 'm.spencer@makers.com',
      password: '2020',
      password_confirmation: '2020'
    )

    visit('/login')

    fill_in('email', with: 'm.spencer@makers.com')
    fill_in('password', with: '2020')
    click_button('Submit')

    click_link('Log Out')

    expect(current_path).to eq('/login')
    expect(page).to have_content('Successfully logged out')
  end
end