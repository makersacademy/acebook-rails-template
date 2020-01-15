feature 'sign up' do
  scenario 'user can sign up with email and password' do
    visit('/sign_up')
    fill_in 'user_email', with: 'dan@test.com'
    fill_in 'user_password', with: 'p1'
    click_on 'Sign up'
    expect(page).to have_current_path '/'
    expect(page).to have_content 'Hello World'
    expect(page).to have_content 'Signed in as: dan@test.com'
  end
end
