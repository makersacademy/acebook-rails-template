feature 'authentication' do
  scenario 'user logs in successfully' do
    create_user_in_test_db

    visit('/login')

    fill_in('email', with: 'm.spencer@makers.com')
    fill_in('password', with: '2020')
    click_button('Submit')

    expect(current_path).to eq('/posts')
    expect(page).to have_content('Successfully logged in')
  end

  scenario 'user enters incorrect email' do
    create_user_in_test_db

    visit('/login')

    fill_in('email', with: 'wrongEmail@makers.com')
    fill_in('password', with: '2020')
    click_button('Submit')

    expect(current_path).to eq('/login')
    expect(page).to have_content('Invalid login details')
  end

  scenario 'user enters incorrect password' do
    create_user_in_test_db

    visit('/login')

    fill_in('email', with: 'm.spencer@makers.com')
    fill_in('password', with: 'wrongPassword')
    click_button('Submit')

    expect(current_path).to eq('/login')
    expect(page).to have_content('Invalid login details')
  end
end