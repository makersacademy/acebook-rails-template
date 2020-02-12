feature   'user can delete posts' do 
 scenario  'user can delete posts from the homepage' do 
  sign_up
  create_post
  click_link 'home'
  click_link 'Delete'
  expect(page).not_to have_content('test message')
 end 

end 