RSpec.feature 'Signup', type: :feature do
  scenario 'User can not use same email twice' do
    visit '/'
    fill_in :first_name, with: 'Dave'
    fill_in :last_name, with: 'Katze'
    fill_in :email, with: 'davethecat@katze.com'
    fill_in :password, with: 'Gato123'
    fill_in :birthday, with: '2000/10/10'
    fill_in :gender, with: 'Male'
    click_button 'Sign Up'
    visit '/'
    fill_in :first_name, with: 'Email'
    fill_in :last_name, with: 'Thief'
    fill_in :email, with: 'davethecat@katze.com'
    fill_in :password, with: 'Evil'
    fill_in :birthday, with: '2001/10/10'
    fill_in :gender, with: 'Female'
    click_button 'Sign Up'
    expect(page.current_path).to eq('/users')
    expect(page).to have_content('has already been ')
  end
end
