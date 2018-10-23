def create_hello_world_post
  visit '/posts'
  click_link 'New post'
  fill_in 'Message', with: 'Hello, world!'
  click_button 'Submit'
end 
