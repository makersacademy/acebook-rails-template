require 'rails_helper'

describe 'user can access different pages when logged in or not logged in' do
  let(:email) { 'testenv@example.com' }
  let(:password) { 'testpass' }
  let!(:user) { User.create(email: email, password: password) }

  context 'when user is not logged in' do
    it 'user who is not logged in tries to view a wall, and is redirected to log in homepage' do
      visit "/#{user.id}"
      expect(page).to have_current_path '/'
      expect(page).to have_button('Log in')
      expect(page).to have_button('Sign up')
      expect(page).not_to have_content(user.email)
    end
  end

  context 'when user is logged in' do
    before do
      visit '/users/sign_in'
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_button 'Log in'
    end

    it 'user who is logged in is redirected from homepage to their wall' do
      visit '/'
      expect(page).to have_current_path("/#{user.id}", ignore_query: true)
      expect(page).to have_content(email)
      expect(page).not_to have_button('Log in')
      expect(page).not_to have_button('Sign up')
    end

    it 'user can view a wall' do
      visit "/#{user.id}"
      expect(page).to have_current_path "/#{user.id}"
      expect(page).to have_content(user.email)
    end

    it "redirects to user's wall if trying to access a non-existant wall" do
      visit "/junk"
      expect(page).to have_current_path("/#{user.id}", ignore_query: true)
    end
  end
end
