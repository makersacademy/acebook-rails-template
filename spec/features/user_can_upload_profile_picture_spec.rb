RSpec.feature "User can view their profile", type: :feature do
  scenario 'successfuly' do
    sign_up_successfully
    click_link 'View profile'
    attach_file('user[avatar]', 'pic_for_test.30.03.png')
    click_button 'Update'
    save_and_open_page
    expect(page).to have_content("Type of Animal:")
    expect(page).to have_css("img[src*='/uploads/profile_pic_for_test.30.03.png']")
  end
end
