require 'rails_helper'

RSpec.feature "Wall", type: :feature do

    scenario "User can see posts they have made on their wall" do
      signup_as_new_user('Pam')
      login_as_user('Pam')
      create_new_post("Hey everyone! It's me, Pam.")
      expect(page).to have_content "Hey everyone! It's me, Pam."
    end

    scenario "Posts on a user's wall can only be seen on their wall" do
      signup_as_new_user('Pam')
      login_as_user('Pam')
      click_link('Newsfeed')
      create_new_post("Hey to the global wall.")
      click_link('LogOut')
      signup_as_new_user('Josh-Lizard')
      login_as_user('Josh-Lizard')
      click_link('Newsfeed')
      click_link('Pam-Lizard')
      create_new_post("Hey, Pam-Lizard. I am writing on your wall.")
      expect(page).to have_content "Hey, Pam-Lizard. I am writing on your wall."
      click_link('Newsfeed')
      expect(page).not_to have_content "Hey, Pam-Lizard. I am writing on your wall."
    end

    scenario "Posts on the global wall are not visible on user's profiles" do
      signup_as_new_user('Pam')
      login_as_user('Pam')
      click_link('Newsfeed')
      create_new_post("Hey to the global wall.")
      expect(page).to have_content "Hey to the global wall."
      click_link('Pam-Lizard')
      expect(page).not_to have_content "Hey to the global wall."
    end

end
