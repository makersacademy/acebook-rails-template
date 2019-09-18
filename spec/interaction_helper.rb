require 'support/features/clearance_helpers'

def create_post(message)
  visit '/posts'
  click_button 'new-post-button' # using the symbol to reference the button by id
  fill_in 'post[message]', with: message
  click_button 'Submit'
  Post.order(:id).last
end

def create_wall_post(message, user_id)
  visit("/users/#{user_id}")
  fill_in(:message, with: message)
  click_button 'post-submit'
  Post.order(:id).last
end

def create_comment(body, post_id)
  visit '/posts'
  within("#post-#{post_id}") do
    fill_in 'comment[body]', with: body
    click_button 'Create Comment'
  end
end
