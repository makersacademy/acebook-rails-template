# frozen_string_literal: true

RSpec.feature "User can view their profile", type: :feature do
  scenario 'successfuly' do
    sign_up_successfully

    click_link 'View profile'
    attach_file('user[avatar]', 'pic_for_test.30.03.png')
    click_button 'Update'
    expect(page.find('.profile_pic')['src']).to have_content 'profile_pic_for_test.30.03.png'
  end
end
