def create_message
    sign_up_user
    sign_in_user
    visit('/posts')
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
end