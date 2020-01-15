feature 'sign in' do
  scenario ' user enters wrong username' do
    visit '/sign_in'
    fill_in 'session_email', with: 'daniel@test.com'
    fill_in 'session_password', with: 'p1'
    click_button 'Sign in'

    expect(page).to have_content 'Bad email or password'
    expect(page).to have_current_path '/session'
  end
end
