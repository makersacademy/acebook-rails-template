module FeatureHelpers
  def sign_in_as_user
    user = create(:user)
    login_as(user, scope: :user)
    visit '/'
  end

  def sign_in_and_create_post
    sign_in_as_user
    visit '/posts'
    click_link 'New post'
    fill_in 'post[message]', with: 'This is a test post!'
    click_button 'Create Post'
  end

  def sign_in_and_create_chatroom
    sign_in_as_user
    click_link 'Live Chat'
    click_link 'New Chat Room'
    fill_in 'chat_room[title]', with: 'Test Chat Room'
    click_button 'Add'
  end

  def sign_in_and_create_album
    sign_in_as_user
    click_link 'My Albums'
    click_link 'Create Album'
    fill_in 'album[title]', with: 'My first album'
    click_link 'Create'
  end

  def view_profile_of_second_user
    user2 = create(:user)
    login_as(user2, scope: :user)

    visit '/posts'
    click_link 'New post'
    fill_in 'post[message]', with: 'This is a test post!'
    click_button 'Create Post'
    click_link 'Sign Out'

    user = create(:user)
    login_as(user, scope: :user)
    visit '/posts'
    click_link 'Alice Bobson'
  end
end
