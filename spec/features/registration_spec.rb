feature 'registration' do
  scenario 'user signs up successfully' do
    visit('/users/new')

    fill_in('username', with: 'Margarida')
    fill_in('email', with: 'margarida@example.pt')
    fill_in('password', with: '2020')
    fill_in('password confirmation', with: '2020')
    click_button('Sign Up')

    expect(current_path).to eq('/sessions/new')
    expect(page).to have_content('Successfully signed up')
  end

  scenario "user's passwords do not match" do
    visit('/users/new')

    fill_in('username', with: 'Margarida')
    fill_in('email', with: 'margarida@example.pt')
    fill_in('password', with: '2020')
    fill_in('password confirmation', with: '2021')
    click_button('Sign Up')

    expect(current_path).to eq('/users')
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  scenario 'username is taken' do
    create_user_in_test_db

    visit('/users/new')

    fill_in('username', with: 'Malachi')
    fill_in('email', with: 'margarida@example.pt')
    fill_in('password', with: '2020')
    fill_in('password confirmation', with: '2020')
    click_button('Sign Up')

    expect(current_path).to eq('/users')
    expect(page).to have_content('Username has already been taken')
  end

  scenario 'email is taken' do
    create_user_in_test_db

    visit('/users/new')

    fill_in('username', with: 'Margarida')
    fill_in('email', with: 'm.spencer@makers.com')
    fill_in('password', with: '2020')
    fill_in('password confirmation', with: '2020')
    click_button('Sign Up')

    expect(current_path).to eq('/users')
    expect(page).to have_content('Email already registered')
  end
end
