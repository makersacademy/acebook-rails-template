
feature 'registration' do
  scenario 'user signs up successfully' do
    visit('/signup')
    p current_path
    fill_in('username', with: 'Margarida')
    fill_in('email', with: 'margarida@example.pt')
    fill_in('password', with: '2020')
    fill_in('password_confirmation', with: '2020')
    fill_in('profile_picture', with: '')
    click_button('Submit')
    p current_path

    expect(current_path).to eq('/posts')
    expect(page).to have_content('posts')
  end
end
