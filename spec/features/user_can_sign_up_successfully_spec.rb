RSpec.feature 'Signup', type: :feature do
  scenario 'User successfully signs up' do
    visit '/'
    fill_in :sign_up_first_name, with: 'Dave'
    fill_in :sign_up_last_name, with: 'Katze'
    fill_in :sign_up_email, with: 'davethecat@katze.com'
    fill_in :sign_up_password, with: 'Gato123'
    fill_in :sign_up_birthday, with: '2000/10/10'
    choose :sign_up_gender, option: 'Male'
    click_button 'Sign Up'
    expect(page.current_path).to eq('/profile')
    expect(page).to have_content('Welcome, Dave Katze!')
  end
end
