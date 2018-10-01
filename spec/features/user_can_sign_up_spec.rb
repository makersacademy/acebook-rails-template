RSpec.feature "Sign Up", type: :feature do
  scenario 'User can visit sign up page' do
    visit '/'
    click_link 'get :sign_up'
    expect(page).to have_content 'Sign up'
  end

  scenario 'User can create account' do
    visit '/customers/sign_up'
    fill_in 'customer_email', with: 'test@test.com'
    fill_in 'customer_password', with: 'test123'
    fill_in 'customer_password_confirmation', with: 'test123'
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
    expect(Customer.all.last[:email]).to eq('test@test.com')
  end
end
