def create_post(message)
  visit '/posts'
  click_link 'Create post'
  fill_in 'Message', with: message
  click_button 'Submit'
end
