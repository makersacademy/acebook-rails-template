feature 'profile photos' do
  scenario 'a user can upload a profile photo' do
      sign_up_as_testy
      click_link('Edit Profile')
      attach_file('avatar', 'spec/images/profile_photo.png')
      click_button('Add Profile Photo')
      expect(page).to have_css('img[src*="profile_photo.png')
  end

end

# click_button('New Post')
#     attach_file('image', 'spec/files/images/llama.jpeg')
#     fill_in('caption', with: 'Llama')
#     click_button('Create Post')
#     expect(page).to have_css('img[src*="llama.jpeg"]')
#     expect(page).to have_content('Llama')
#     expect(current_path).to eq('/posts')
#   end