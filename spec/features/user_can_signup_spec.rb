RSpec.feature 'Users can signup to site', type: :feature do
  scenario 'Can visit Signup Page' do
    visit('/')
    click_on('Signup')
    expect(page).to have_content('Please Signup')
  end

  scenario 'User can signup' do
    visit('/')
    click_on('Signup')
    fill_in('user[email]', with: 'test@test.com')
    fill_in('user[password]', with: 'password')
    click_on('Signup')
    expect(page).to have_content('Congratulations test@test.com, You Have Signed Up to AceBook!')
  end
end
