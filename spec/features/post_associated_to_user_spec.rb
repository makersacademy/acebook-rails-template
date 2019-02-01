RSpec.feature do 
  scenario 'User can only see their posts on their profile' do 
    signup_and_click
    click_on 'New Post'
    fill_in 'Message', with: 'Message1'
    click_button 'Submit'
    click_on 'New Post'
    fill_in 'Message', with: 'Message2'
    # visit '/signin'
    # second_user_signup_and_click
    # click_on 'New Post'
    # fill_in 'Message', with: 'SecondUserMessage'
    # click_button 'Submit'
    # visit '/signup'
expect(page.current_path = '/users/1')
expect(page).to_have content('Message1')
expect(page).not to have_content(


  


    
end 