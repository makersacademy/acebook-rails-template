feature 'updating own posts' do
  scenario 'user can update their own posts up to 10 minutes' do
    visit('/users/sign_up')
    fill_in('Name', with: 'Testy')
    fill_in('Surname', with: 'Testerson')
    fill_in('Email', with: 'test@test.com')
    fill_in('Password', with: 'Password123')
    fill_in('Password confirmation', with: 'Password123')

    click_link('New post')
    fill_in('message', with: 'test post')
    click_button('Submit')
    expect(page).to have_content('test post')

    click_button('update')
    fill_in('post', with: 'new post')
    click_button('Submit')

    expect(page).not_to have_content('test post')
    expect(page).to have_content('new post')
  end
end
