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
    create_user_in_test_db

    visit('/signup')

    fill_in('username', with: 'Malachi')
    fill_in('email', with: 'margarida@example.pt')
    fill_in('password', with: '2020')
    fill_in('password_confirmation', with: '2020')
    click_button('Submit')

    expect(current_path).to eq('/signup')
    expect(page).to have_content('Username taken, please choose a different username')
  end

  scenario 'email is taken' do
    create_user_in_test_db

    visit('/signup')

    fill_in('username', with: 'Margarida')
    fill_in('email', with: 'm.spencer@makers.com')
    fill_in('password', with: '2020')
    fill_in('password_confirmation', with: '2020')
    click_button('Submit')

    expect(current_path).to eq('/signup')
    expect(page).to have_content('Email already registered')
  end
end
