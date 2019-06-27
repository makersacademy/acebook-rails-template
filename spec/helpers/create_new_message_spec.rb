def create_message
    sign_up_user
    sign_in_user
    visit('/posts')
    fill_in 'post_message', with: 'Hello, world!'
    click_button 'Submit'
end
