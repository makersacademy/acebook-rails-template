RSpec.feature 'Signup', type: :feature do
  scenario 'User successfully signs up' do
    fill_in_sign_up_details
    click_button 'Sign Up'
    expect(page.current_path).to eq('/posts')
  end
end
