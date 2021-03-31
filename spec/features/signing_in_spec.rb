require 'rails_helper'
require 'sessions_helper'

feature "Authentication" do

    subject { page }
    let(:submit) { "Sign in" }

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
            visit('/signin')
            fill_in 'session[email]', with: @user.email.upcase
            fill_in 'session[password]', with: @user.password
            click_button 'Sign in'
        end

        scenario 'should redirect to their posts page' do
            expect(page).to have_content("You are now signed in as Lizardo")
        end
    
    end

    feature 'with wrong password' do
        before do
            visit('/signin')
            fill_in 'session[email]', with: @user.email.upcase
            fill_in 'session[password]', with: "wrongp"
            click_button 'Sign in'
        end

        scenario 'should not show user page' do
            expect(page).to have_content("Wrong password!")
            expect(page).not_to have_current_path("/users/#{@user.id}")
        end
     
    end

    feature 'with wrong email' do
        before do
            visit('/signin')
            fill_in 'session[email]', with: "justmakinitup"
            fill_in 'session[password]', with: "wrongp"
            click_button 'Sign in'
        end

        scenario 'should not show user page' do
            expect(page).to have_content("We can't find your info on our records - please try again.")
            expect(page).not_to have_current_path("/users/#{@user.id}")
        end
    
    end

end