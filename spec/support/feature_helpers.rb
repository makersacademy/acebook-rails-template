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
end
