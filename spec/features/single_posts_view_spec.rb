RSpec.feature 'Single page post', type: :feature do

    before do
      visit '/customers/sign_up'
      fill_in 'customer_email', with: 'test@test.com'
      fill_in 'customer_password', with: 'test123'
      fill_in 'customer_password_confirmation', with: 'test123'
      click_button 'Sign up'
    end


    scenario 'A user can make a post submission directly on the posts page' do

      click_link 'get :posts'
      expect(page).to have_button "Submit"



  end
end
