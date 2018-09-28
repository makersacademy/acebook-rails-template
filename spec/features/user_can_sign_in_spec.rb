RSpec.feature 'Sign In', type: :feature do
  scenario 'If user has no account, they can\'t sign in' do
    visit '/'
    click_link 'Sign in'
    fill_in 'customer_email', with: 'tess@test.com'
    fill_in 'customer_password', with: '123456'
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end

  scenario 'If user has an account they can sign in' do
    customer = {email: 'tess@test.com', password: '123456'}
    Customer.create(customer)
    visit '/'
    click_link 'Sign in'
    fill_in 'customer_email', with: 'tess@test.com'
    fill_in 'customer_password', with: '123456'
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end
end
