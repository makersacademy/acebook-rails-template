require 'rails_helper'

feature "Authentication" do

    subject { page }

    before do 
        @user = User.new(name: "Lizardo", email: "lizard@example.com", password: "123secure", password_confirmation: "123secure")
        @user.save
    end
  
    feature "signin page" do
      before { visit signin_path }
      it { is_expected.to have_selector('h1', text: 'Sign in') }
    end

    feature 'with valid information' do
        before do
            visit signin_path
            fill_in 'email', with: @user.email.upcase
            fill_in 'password', with: @user.password
            click_button 'Sign in'
        end

        scenario 'should redirect to their posts page' do
            expect(page).to have_content("You are now signed in as Lizardo")
        end
    
    end

end