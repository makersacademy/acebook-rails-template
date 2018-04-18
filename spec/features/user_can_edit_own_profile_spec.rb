feature 'editing user profiles' do
  background do
    # Create a user.
    # Create a second user
    # Create a post owned by the user.
    # Create a post owned by the second user.
    # Sign in with the first user.
    # Visit the dashboard.
  end

  scenario 'a user can change their own profile details' do
    # Click the first user's user name
    # Click the 'Edit Profile' button.
    # Click the 'Choose new profile image' button.
    # Select the new image.
    # Fill in the bio field with 'This is an example of bio'
    # Click the 'Update Profile' button.

    # Expect to be routed to the profile page.
    # Expect to see the updated profile image.
    # Expect to see the updated profile bio.
  end

  scenario 'a user cannot change someone elses profile picture' do
    # Click the first user's user name

    # Expect to not see the 'edit profile' button.
  end

  scenario "a user cannot navigate directly to edit a users profile" do
    # Directly visit another user’s edit url.

    # Expect to not see ’Change your profile image:'
    # Expect the path to be the root path.
    # Expect to see the message, "That profile doesn’t belong to you!"
  end
