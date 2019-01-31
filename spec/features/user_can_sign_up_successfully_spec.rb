RSpec.feature 'Signup', type: :feature do
  scenario 'User successfully signs up' do
    visit '/'
    fill_in :first_name, with: 'Dave'
    fill_in :last_name, with: 'Katze'
    fill_in :email, with: 'davethecat@katze.com'
    fill_in :password, with: 'Gato123'
    fill_in :birthday, with: '2000/10/10'
    choose :male, option: 'Male'
    click_button 'Sign Up'
    expect(page.current_path).to eq('/users')
  end
end
