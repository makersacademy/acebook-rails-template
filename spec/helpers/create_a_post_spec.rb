def new_post
  click_link 'New post'
  fill_in 'post_message', with: 'I, wanna be, a little seahorse.'
  click_button 'Submit'
end

def new_post_alt
  click_link 'New post'
  fill_in 'post_message', with: 'Sugarcubes megafan alert!'
  click_button 'Submit'
end
