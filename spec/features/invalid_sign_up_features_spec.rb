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
    fill_in :password, with: 'Evil123'
    fill_in :birthday, with: '2001/10/10'
    fill_in :gender, with: 'Female'
    click_button 'Sign Up'
    expect(page.current_path).to eq('/users')
    expect(page).to have_content('has already been taken')
  end

  scenario 'User cannot provide email without @' do
    visit '/'
    fill_in :last_name, with: 'Thief'
    fill_in :email, with: 'davethecat1-at-katze.com'
    fill_in :password, with: 'Evil123'
    fill_in :birthday, with: '2001/10/10'
    fill_in :gender, with: 'Female'
    click_button 'Sign Up'
    expect(page.current_path).to eq('/users')
    expect(page).to have_content("is invalid")
  end

  scenario 'User cannot chose password shorter than 6 characters' do
    visit '/'
    fill_in :last_name, with: 'Thief'
    fill_in :email, with: 'davethecat1@katze.com'
    fill_in :password, with: '12345'
    fill_in :birthday, with: '2001/10/10'
    fill_in :gender, with: 'Female'
    click_button 'Sign Up'
    expect(page.current_path).to eq('/users')
    expect(page).to have_content("is too short (minimum is 6 characters)")
  end

  scenario 'User can not leave first_name field empty' do
    visit '/'
    fill_in :last_name, with: 'Thief'
    fill_in :email, with: 'davethecat1@katze.com'
    fill_in :password, with: 'Evil123'
    fill_in :birthday, with: '2001/10/10'
    fill_in :gender, with: 'Female'
    click_button 'Sign Up'
    expect(page.current_path).to eq('/users')
    expect(page).to have_content("can't be blank")
  end

  scenario 'User can not leave last_name field empty' do
    visit '/'
    fill_in :first_name, with: 'Email'
    fill_in :email, with: 'davethecat2@katze.com'
    fill_in :password, with: 'Evil123'
    fill_in :birthday, with: '2001/10/10'
    fill_in :gender, with: 'Female'
    click_button 'Sign Up'
    expect(page.current_path).to eq('/users')
    expect(page).to have_content("can't be blank")
  end

  scenario 'User can not leave email field empty' do
    visit '/'
    fill_in :first_name, with: 'Email'
    fill_in :last_name, with: 'Thief'
    fill_in :password, with: 'Evil123'
    fill_in :birthday, with: '2001/10/10'
    fill_in :gender, with: 'Female'
    click_button 'Sign Up'
    expect(page.current_path).to eq('/users')
    expect(page).to have_content("can't be blank")
  end

  scenario 'User can not leave birthday field empty' do
    visit '/'
    fill_in :first_name, with: 'Email'
    fill_in :last_name, with: 'Thief'
    fill_in :email, with: 'davethecat3@katze.com'
    fill_in :password, with: 'Evil123'
    fill_in :gender, with: 'Female'
    click_button 'Sign Up'
    expect(page.current_path).to eq('/users')
    expect(page).to have_content("can't be blank")
  end

  scenario 'User can not leave password field empty' do
    visit '/'
    fill_in :first_name, with: 'Email'
    fill_in :last_name, with: 'Thief'
    fill_in :email, with: 'davethecat3@katze.com'
    fill_in :birthday, with: '01/01/1995'
    fill_in :gender, with: 'Female'
    click_button 'Sign Up'
    expect(page.current_path).to eq('/users')
    expect(page).to have_content("can't be blank")
  end

  scenario 'User can not leave gender field empty' do
    visit '/'
    fill_in :first_name, with: 'Email'
    fill_in :last_name, with: 'Thief'
    fill_in :email, with: 'davethecat3@katze.com'
    fill_in :password, with: 'Evil123'
    fill_in :birthday, with: '01/01/1995'
    click_button 'Sign Up'
    expect(page.current_path).to eq('/users')
    expect(page).to have_content("can't be blank")
  end
end
