require 'rails_helper'

feature 'user homepage' do
    before(:each) do
      @user = User.new(name: "Lizardo", email: "lizard@example.com", password: "123secure", password_confirmation: "123secure")
      @user.save
      sign_in_helper(@user)
    end

    scenario 'if no posts, message shows on their page' do
        click_link "Your Posts"
        expect(page).to have_content("You haven't posted yet!")
    end

    scenario 'create a post and it appears on their page' do
      click_link "New Post"
      fill_in "post[message]", with: "Hello Lizard"
      click_button "Submit"
      click_link "Your Posts"
      expect(page).not_to have_content("You haven't posted yet!")
      expect(page).to have_content("Hello Lizard")
    end

    scenario 'post does not show for other users' do
        click_link "Sign out"
        @user = User.new(name: "Elizabeth Lizard", email: "queenlizard@example.com", password: "mypassword", password_confirmation: "mypassword")
        @user.save
        sign_in_helper(@user)
        click_link "Your Posts"
        expect(page).to have_content("You haven't posted yet!")
        expect(page).not_to have_content("Hello Lizard")
      end

    scenario 'post does not show for other users' do
      click_link "Sign out"
      visit("/users/#{@user.id}")
      expect(page).to have_content("You must be signed in to view that page!")
      expect(page).not_to have_content("Hello Lizard")
    end

  end
