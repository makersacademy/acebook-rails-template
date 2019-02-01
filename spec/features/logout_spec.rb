RSpec.feature 'User logout' do

  let(:email){'bea_courage@hotmail.co.uk'}
  let(:password){'featuretest'}

  context 'Logout' do
    scenario 'A user can logout to take you back to homepage' do
      visit '/'
      click_on 'Signup'
      fill_in "user_email", with: email
      fill_in "user_password", with: password
      fill_in "user_password_confirmation", with: password
      click_button 'Sign up'
      click_on 'Logout'
      expect(page.current_path).to eql('/')
    end

  end


end
