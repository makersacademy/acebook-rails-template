feature 'registration' do
  scenario 'user signs up successfully' do
    visit('/signup')

    fill_in('username', with: 'Margarida')
    fill_in('email', with: 'margarida@example.pt')
    fill_in('password', with: '2020')
    fill_in('password_confirmation', with: '2020')
    click_button('Submit')

    expect(current_path).to eq('/posts')
    expect(page).to have_content('Posts!')
  end

  scenario "user's passwords do not match" do
    visit('/signup')

    fill_in('username', with: 'Margarida')
    fill_in('email', with: 'margarida@example.pt')
    fill_in('password', with: '2020')
    fill_in('password_confirmation', with: '2021')
    click_button('Submit')

    expect(current_path).to eq('/signup')
    expect(page).to have_content('Password does not match confirmation')
  end

  scenario 'username is taken' do
    user = User.create(
      username: 'Margarida',
      email: 'margarida@emakers.pt',
      password: '2020',
      password_confirmation: '2020'
    )

    visit('/signup')

    fill_in('username', with: 'Margarida')
    fill_in('email', with: 'margarida@example.pt')
    fill_in('password', with: '2020')
    fill_in('password_confirmation', with: '2020')
    click_button('Submit')

    expect(current_path).to eq('/signup')
    expect(page).to have_content('Username taken, please choose a different username')
  end

  scenario 'email is taken' do
    user = User.create(
      username: 'Peter',
      email: 'peter@example.pt',
      password: '2020',
      password_confirmation: '2020'
    )

    visit('/signup')

    fill_in('username', with: 'Margarida')
    fill_in('email', with: 'peter@example.pt')
    fill_in('password', with: '2020')
    fill_in('password_confirmation', with: '2020')
    click_button('Submit')

    expect(current_path).to eq('/signup')
    expect(page).to have_content('Email already registered')
  end
end
