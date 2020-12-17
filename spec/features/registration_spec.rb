feature 'registration' do
  scenario 'user signs up successfully' do
    visit('/signup')

    fill_in('username', with: 'Margarida')
    fill_in('email', with: 'margarida@example.pt')
    fill_in('password', with: '2020')
    fill_in('password_confirmation', with: '2020')
    fill_in('profile_picture', with: '')
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
    fill_in('profile_picture', with: '')
    click_button('Submit')

    expect(current_path).to eq('/signup')
    expect(page).to have_content('Password does not match confirmation')
  end
end
