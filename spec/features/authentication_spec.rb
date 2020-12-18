feature 'authentication' do
  scenario 'user logs in successfully' do
    user = User.create(
      username: 'Malachi',
      email: 'm.spencer@makers.com',
      password: '2020',
      password_confirmation: '2020'
    )

    visit('/login')

    fill_in('email', with: 'm.spencer@makers.com')
    fill_in('password', with: '2020')
    click_button('Submit')

    expect(current_path).to eq('/posts')
    expect(page).to have_content('Successfully logged in')
  end
end