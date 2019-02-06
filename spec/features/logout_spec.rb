RSpec.feature 'User logout' do

  let(:email){'bea_courage@hotmail.co.uk'}
  let(:username){'Makers'}
  let(:password){'featuretest'}

  context 'Logout' do
    scenario 'A user can logout to take you back to homepage' do
      sign_up(email, username, password)
      click_link 'Logout'
      expect(page.current_path).to eql('/login')
    end

  end


end
