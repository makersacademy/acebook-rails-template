feature 'viewing user profiles' do
  background do
    # Create a user.
    # Create a second user
    # Create a post owned by the user.
    # Create a post owned by the second user.
    # Sign in with the first user.
    # Visit the dashboard.
    # Click the first user's user name
  end

  scenario 'visiting a profile page shows the user name in the url' do
    # Expect the page's URL to be '/users/user-name'.
  end

  scenario "a profile page only shows the specified user's posts" do
    # expect the page to show the user-owned post.
    # expect the page to not show the other user's post.
  end
end
