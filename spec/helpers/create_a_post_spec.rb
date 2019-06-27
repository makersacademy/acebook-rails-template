def new_post
  fill_in 'post_message', with: 'I, wanna be, a little seahorse.'
  click_button 'Submit'
end
